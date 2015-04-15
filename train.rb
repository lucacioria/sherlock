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

  # (int, [Transfer], ProfileKind) => [Profile]
  def self.create_profiles_for_user(user_id, user_transfers, profile_kind)
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

end
