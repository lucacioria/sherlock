module Util

  # ([A], int) => [[A]]
  # sliding window that returns nils in first size-1 windows
  def self.sliding_window(a, size)
    (0...a.size).map do |i|
       [nil] * [0, (size - i - 1)].max + a[[0, i - size + 1].max .. i]
    end
  end

  # (Profile) => Profile
  def self.create_empty_profile(example_profile, month)
    h = Array.new(example_profile.histogram.size, 0)
    Profiles.new({user_id: example_profile.user_id, month: month, histogram: h,
                  profile_kind_id: example_profile.profile_kind_id})
  end

  # (String) => String
  # succ() for month strings in the form: 2014-03
  def self.next_month(month_string)
    year = month_string[0...4].to_i
    month = month_string[5...7].to_i
    new_month = month % 12 + 1
    new_year = if new_month == 1 then year + 1 else year end
    "%d-%02d" % [new_year, new_month]
  end

  # (String, String) => [String]
  def self.list_months_in_between(month_start, month_end)
    out = []
    month = month_start
    while next_month(month) != month_end do
      out << next_month(month)
      month = next_month(month)
    end
    out
  end

  # ([Profile]) => [Profile]
  # fills empty months with empty profiles
  def self.fill_empty_months(profiles)
    sorted = profiles.sort{|x,y| x.month <=> y.month}
    sorted.reduce([]){|acc, p|
      if acc.length > 0 then
        acc += list_months_in_between(acc.last.month, p.month).map{|m|
          create_empty_profile(p, m)
        }
      end
      acc << p
      acc
    }
  end

end
