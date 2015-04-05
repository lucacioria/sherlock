class Histogram

  include Math

  attr_reader :data, :identifier

  @data = []
  def initialize(data, identifier = nil)
    @data = data
    @identifier = identifier
  end

  def distance1(b)
    a = self
    raise 'Histogram distance1 requires histograms with equal number of buckets' if a.data.length != b.data.length
    a.data.zip(b.data).map{|x| x[0] - x[1]}.map(&:abs).inject(:+)
  end

  def distance_euclidean(b)
    a = self
    raise 'Histogram distance1 requires histograms with equal number of buckets' if a.data.length != b.data.length
    sqrt(a.data.zip(b.data).map {|x| (x[1] - x[0])**2 }.reduce(:+))
  end

  def self.distance1(a, b)
    a.distance1 b
  end

  def self.distance2_circular(a, b, df)
    a.distance2_circular(b, df)
  end

  def distance2_circular(b, df)
    (self.distance2_circular_directional(b, df) + b.distance2_circular_directional(self, df)) / 2
  end

  def distance2_circular_directional(b, df)
    debug = false
    a = self
    raise 'Histogram distance1 requires histograms with equal number of buckets' if a.data.length != b.data.length
    size = a.data.length
    max_distance = size / 2
    # compute difference
    puts "\n\n=== DIFFERENCE ===\n\n\n" if debug
    difference = a.data.map.with_index {|v, i|
      puts "#{i}, value: #{v}" if debug
      discounted_value_b = (0..max_distance).map {|d|
        current_b_left = b.data[(i - d) % size]
        current_b_right = b.data[(i + d) % size]
        discounted_left = discount(current_b_left, d, df)
        discounted_right = discount(current_b_right, d, df)
        discounted = if d == 0 || d == max_distance then discounted_left else discounted_left + discounted_right end
        puts "  [%01d] a: %01d b: %01d,%01d discounted: %f, %f = %f" % [d, v, current_b_left, current_b_right, discounted_left, discounted_right, discounted] if debug
        discounted
      }.reduce(:+)
      diff = [0, v - discounted_value_b].max
      puts "[%01d] a: %01d b: %01d diff: %f\n\n\n" % [i, v, b.data[i], diff] if debug
      diff
    }.reduce(:+)
    puts "difference: #{difference}" if debug
    # compute similarity
    puts "\n\n=== SIMILARITY ===\n\n\n" if debug
    similarity = a.data.map.with_index {|v, i|
      puts "#{i}, value: #{v}" if debug
      (0..max_distance).map {|d|
        current_b_left = b.data[(i - d) % size]
        current_b_right = b.data[(i + d) % size]
        discounted_left = discount(current_b_left, d, df)
        discounted_right = discount(current_b_right, d, df)
        discounted = if d == 0 || d == max_distance then discounted_left else discounted_left + discounted_right end
        discounted
      }.map{|x| [x,v].min}.reduce(:+)
    }.reduce(:+)
    puts "similarity: #{similarity}" if debug
    difference
  end

  def to_s
    "H(#{@data.join ', '})"
  end

  def plot(size = 80, show_index = true)
    to_s + "\n" + @data.map.with_index{|x,i|
      ("%02d: " % i) + '#' * (x.to_f / data.max * size).to_i + (if x > 0 then " (#{x})" else "" end)
    }.join("\n")
  end

  def discount(value, steps, discount_factor)
    value * exp(-discount_factor * steps)
  end

end

=begin
a = Histogram.new([1,0,2,4,0,1])
b = Histogram.new([4,2,1,0,0,1])
c = Histogram.new([1,0,2,4,0,1])
d = Histogram.new([0,15, 0,0,0 ,0])
e = Histogram.new([0,0 , 0,0,10,0])
f = Histogram.new([0,0 ,0,10,0 ,0])
[0.5, 1, 2].each {|df|
  puts "distance 2, discount factor: #{df}"
  puts d.distance2_circular(e, df)
  puts d.distance2_circular(f, df)
}
puts "euclidean:"
puts d.distance_euclidean(e)
puts d.distance_euclidean(f)
puts "distance 1"
puts d.distance1(e)
puts d.distance1(f)
=end
