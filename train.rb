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

  # (int, ProfileKind) => [Profile]
  def self.create_profiles_for_user(user_id, profile_kind)
    c = profile_kind.config
    Transfers.where(user_id: user_id).group_by(&:month).map{|month, transfers|
      histogram = transfers.reduce(Array.new(c[:number_of_bins], 0)){|h, t|
        bin =
          case c[:binning]
          when 'log'
            log_binning(c[:min_value], c[:max_value], c[:number_of_bins], t[c[:field]])
          when 'linear'
            linear_binning(c[:min_value], c[:max_value], c[:number_of_bins], t[c[:field]])
          end
        h[bin] = h[bin].nil? ? 1 : h[bin] + 1
        h
      }
      [month, histogram]
    }.map{|x|
      Profiles.new({user_id: user_id, month: x[0], histogram: x[1], profile_kind_id: profile_kind.id})
    }
  end

  # (int) => [Profile]
  def self.create_all_profiles_for_user(user_id)
    ProfileKinds.all.map{|profile_kind| create_profiles_for_user(user_id, profile_kind)}.flatten
  end

  # WRITES ON DB !!!
  # (int)
  def self.save_all_profiles_for_user(user_id)
    create_all_profiles_for_user(user_id).each(&:save)
  end

end
