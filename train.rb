module Train

  # (float, float, float, float) => int
  def self.log_binning(min, max, steps, value)
    # find log base such as to divide range in correct n. of steps
    base = (max.to_f - min.to_f) ** (1 / steps.to_f)
    # return log of value, constrained in 0...steps
    [0, [steps - 1, Math.log(value.to_f, base).to_i].min].max
  end

  # (float, float, float, float) => int
  def self.linear_binning(min, max, steps, value)
    bin_size = (max - min) / steps.to_f
    # return bin, constrained in 0...steps
    [0, [steps - 1, (value / bin_size).to_i].min].max
  end

  # ([float], float) => int
  def self.custom_intervals_binning(intervals, value)
    # intervals are inclusive left: [1,100)
    # the `||` kicks in in case of nil, which means last bin
    intervals.find_index{|x| x > value} || intervals.length
  end

  # ([string], string) => int
  def self.categorical_binning(categories, value)
    categories.find_index{|set| set.include? value} || categories.length
  end

  # (Histogram, {}) => Histogram
  def self.smooth(histogram, profile_kind)
    c = profile_kind.config
    if c[:smooth] then
      histogram.gaussian_smooth(c[:sigma] || 1, !!c[:circular])
    else
      histogram
    end
  end

  # ([Profile], ProfileKind) => float
  # given a list of profiles and their profile kind, returns
  # the distance of the last one to the past ones,
  # exponentially discounted
  def self.temporal_distance(profiles, profile_kind)
    return 0 if profiles.length == 1
    raise 'there must be at least 1 profile' if profiles.nil? || profiles.length == 0
    c = profile_kind.config
    last_histogram = Histogram.new(profiles.last.histogram)
    last_histogram_smoothed = smooth(last_histogram, profile_kind)
    distances = profiles[0...-1].map{|p|
      h = Histogram.new(p.histogram)
      smoothed = smooth(h, profile_kind)
      smoothed.distance_euclidean(last_histogram_smoothed)
    }
    weights = (0...distances.size).map{|i|
      Histogram::exp_discount_value(1, i, c[:discount_factor] || 0.5)
    }.reverse
    final_distance = Histogram::weighted_avg(distances, weights)
    final_distance
  end

  # ([Transfer], ProfileKind) => [Profile]
  def self.create_profiles_for_user(user_transfers, profile_kind)
    c = profile_kind.config
    user_transfers.group_by(&:month).map{|month, transfers|
      number_of_bins =
        c[:number_of_bins] ||
        (c[:intervals] && c[:intervals].length + 1) ||
        (c[:categories] && c[:categories].length + 1)
      histogram = transfers.reduce(Array.new(number_of_bins, 0)){|h, t|
        value = t[c[:field]]
        bin =
          case c[:binning]
          when 'log'
            log_binning(c[:min_value], c[:max_value], c[:number_of_bins], value)
          when 'linear'
            linear_binning(c[:min_value], c[:max_value], c[:number_of_bins], value)
          when 'custom_intervals'
            custom_intervals_binning(c[:intervals], value)
          when 'categorical'
            categorical_binning(c[:categories], value)
          end
        h[bin] += 1
        h
      }
      [month, histogram]
    }.map{|x|
      Profiles.new({user_id: user_transfers[0].user_id, month: x[0], histogram: x[1],
                    profile_kind_id: profile_kind.id})
    }
  end

  # ======================
  # DB functions here
  # ======================

  # READS FROM DB !!!
  # (int) => [Profile]
  def self.create_all_profiles_for_user(user_id)
    user_transfers = Transfers.where(user_id: user_id)
    ProfileKinds.all.map{|profile_kind|
      create_profiles_for_user(user_transfers, profile_kind)
    }.flatten
  end

  # WRITES ON DB !!!
  # (int) => nil
  def self.save_all_profiles_for_user(user_id)
    Profiles.delete_all(user_id: user_id)
    create_all_profiles_for_user(user_id).each(&:save)
  end

  # WRITES ON DB !!!
  # () => nil
  def self.save_all_profiles
    Profiles.connection.execute('truncate table profiles')
    Transfers.distinct.pluck(:user_id).each_with_index{|user_id, i|
      save_all_profiles_for_user(user_id)
      puts i if i % 100 == 0
    }
  end

  # READS FROM DB !!!
  # (int) => [Profile]
  def self.compute_all_distances_for_user_profiles(user_id)
    Profiles.where(user_id: user_id).group_by(&:profile_kind_id).map {|pk_id, profiles|
      profile_kind = ProfileKinds.find(pk_id)
      c = profile_kind.config
      profiles_with_empty_months_filled = Util::fill_empty_months(profiles)
      Util::sliding_window(profiles_with_empty_months_filled,
                           c[:window_size] || 3).map do |profiles_current_window|
        distance = temporal_distance(profiles_current_window.compact, profile_kind)
        profiles_current_window.last.distance = distance
        profiles_current_window.last
      end
    }.flatten
  end

  # WRITES ON DB !!!
  # (int) => nil
  def self.save_all_distances_for_user_profiles(user_id)
    Profiles.where(user_id: user_id).update_all(distance: -1)
    compute_all_distances_for_user_profiles(user_id).each(&:save)
  end

  # WRITES ON DB !!!
  # () => nil
  def self.save_all_distances()
    Transfers.distinct.pluck(:user_id).each_with_index{|user_id, i|
      save_all_distances_for_user_profiles(user_id)
      puts i if i % 100 == 0
    }
  end

end
