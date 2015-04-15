module Util

  # ([A], int) => [[A]]
  # sliding window that returns nils in first size-1 windows
  def self.sliding_window(a, size)
    (0...a.size).map do |i|
       [nil] * [0, (size - i - 1)].max + a[[0, i - size + 1].max .. i]
    end
  end

end
