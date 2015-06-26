class Histogram

  include Math

  attr_reader :data, :identifier

  # immutable initialization (freeze)
  # Histograms cannot change once created
  @data = []
  def initialize(data, identifier = nil)
    raise 'contains negative values' if data.any?{|x| x < 0}
    @data = data
    @data.freeze
    @identifier = identifier
    @identifier.freeze
  end

  # ===============================
  # CLASS METHODS
  # ===============================

  # (float, int, float) => float
  # returns `value` discounted exponentially
  def self.exp_discount_value(value, steps, discount_factor)
    value * Math.exp(-discount_factor * steps)
  end

  # (float, int) => [float]
  # returns an array filled with the value of the gaussian function
  # starting from 0, going in integer steps to +size, -size
  def self.gaussian_array(sigma, size)
    (-size..size).map{|x| Histogram::gaussian(sigma, x)}
  end

  # (float, float) => float
  # computes the gaussian function
  def self.gaussian(sigma, x)
    Math.exp(-0.5*((x.to_f / sigma) ** 2)) / (sigma * Math.sqrt(2*Math::PI))
  end

  # ([float|nil], [float]) => float
  # computes the weighted average of `values` with `weights`
  # nil elements in `values` are ignored, along with their weight
  def self.weighted_avg(values, weights)
    raise "negative weights" if weights.any?{|x| x<0}
    raise "value and weight arrays are of different lengths" if values.length != weights.length
    totals = values
      .zip(weights)
      .select{|vw| !vw[0].nil?}
      .reduce({w: 0, v:0}) {|a, vw|
        a[:w] += vw[1]; a[:v] += vw[0] * vw[1]
        a
      }
    totals[:v] / totals[:w].to_f
  end

  # ([Histogram], float) => Histogram
  # creates average histograms averaging a list of histograms with exp discount
  def self.exp_discounted_average(histograms, discount_factor)
    require 'pp'
    raise 'nil histogram in list of histograms to average' if histograms.any?{|x|x.nil?}
    raise 'empty list of histograms to average' if histograms.length == 0
    return histograms.first if histograms.length == 1
    weights = (0...histograms.size).map{|i|
      Histogram::exp_discount_value(1, i, discount_factor)
    }.reverse
    new_data = histograms.map(&:data).transpose.map{|xs| Histogram::weighted_avg(xs, weights)}
    raise 'average histogram contains errors' if new_data.length != histograms.first.data.length
    Histogram.new(new_data)
  end

  # (Histogram, Histogram) => float
  # city block distance between the two histograms (as vectors)
  def self.distance_city_blocks(a, b)
    a.distance_city_blocks b
  end

  # (Histogram, Histogram) => float
  # euclidean distance between the two histograms (as vectors)
  def self.distance_euclidean(a, b)
    a.distance_euclidean b
  end

  # (Histogram, Histogram, float) => float
  # distance2 circular between the two histograms (as discrete pdfs)
  # note: here for benchmarking, doesn't work very well
  def self.distance2_circular(a, b, discount_factor)
    a.distance2_circular(b, discount_factor)
  end

  # (Histogram, Histogram, float) => float
  # distance2 circular directional between the two histograms (as discrete pdfs)
  # note: here for benchmarking, doesn't work very well
  def self.distance2_circular_directional(a, b, discount_factor)
    a.distance2_circular_directional(b, discount_factor)
  end

  # ===============================
  # INSTANCE METHODS
  # ===============================

  # self, (int, int, boolean) => [float]
  # returns a subset of the elements in `histogram` taking `size` elements
  # left and right of the element in position `center`
  #
  # - if `circular` the last bin will be considered next to the first bin
  # - if not `circular` the neighbours output will be filled with nil if a
  #   boundary is reached
  def neighbours(size, center, circular)
    raise "size too big" if size * 2 + 1 > self.data.length
    min = if circular
            (center - size) % self.data.length
          else
            center - size
          end
    max = if circular
            (center + size) % self.data.length
          else
            center + size
          end
    indices = if min < max
                (min..max).to_a
              else
                ((min...self.data.length).to_a + (0..max).to_a)
              end
    indices.map{|i| if i < 0 then nil else self.data[i] end}
  end

  # self, (float, boolean) => Histogram
  # return a smothed histogram without modifying the current one
  def gaussian_smooth(sigma, circular=false)
    size = [sigma * 3, self.data.length / 2].min.to_i
    new_data = self.data.map.with_index do |v, i|
      Histogram::weighted_avg(neighbours(size, i, circular), Histogram::gaussian_array(sigma, size))
    end
    Histogram.new(new_data)
  end

  # self, (float, int) => Histogram
  # returns a new histograms with values exponentially discounted
  def exp_discount(discount_factor, steps)
    Histogram.new(self.data.map{|x| Histogram::exp_discount_value(x, steps, discount_factor)})
  end

  # see self.distance_city_blocks
  def distance_city_blocks(b)
    a = self
    raise 'distance_city_blocks requires histograms with equal number of buckets' if a.data.length != b.data.length
    a.data.zip(b.data).map{|x| x[0] - x[1]}.map(&:abs).inject(:+)
  end

  #
  def distance_paper_ordinal(b)
    a = self
    raise 'distance_paper_ordinal requires histograms with equal number of buckets' if a.data.length != b.data.length
    sum_diff = (a.data.reduce(:+) - b.data.reduce(:+)).abs
    if sum_diff > 0.01
      pp a.data
      pp b.data
      raise "distance_paper_ordinal requires normalized histograms (diff = #{sum_diff})"
    end
    prefix_sum = 0
    h_dist = 0
    a.data.zip(b.data).map {|v|
      #puts "a=#{v[0]},\tb=#{v[1]},\t\tprefix_sum=#{prefix_sum},\th_dist=#{h_dist}"
      prefix_sum += v[0] - v[1]
      h_dist += prefix_sum.abs
      #puts "\t\t\tprefix_sum=#{prefix_sum},\th_dist=#{h_dist}"
    }
    h_dist
  end

  # see self.distance_supereuclidean
  def distance_supereuclidean(b, e)
    a = self
    raise 'distance_euclidean requires histograms with equal number of buckets' if a.data.length != b.data.length
    sqrt(a.data.zip(b.data).map {|x| (x[1] - x[0])**2 }.reduce(:+)) ** e
  end

  # see self.distance_euclidean
  def distance_euclidean(b)
    a = self
    raise 'distance_euclidean requires histograms with equal number of buckets' if a.data.length != b.data.length
    sqrt(a.data.zip(b.data).map {|x| (x[1] - x[0])**2 }.reduce(:+))
  end

  # see self.distance2_circular
  def distance2_circular(b, df)
    (self.distance2_circular_directional(b, df) + b.distance2_circular_directional(self, df)) / 2
  end

  # see self.distance2_circular_directional
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
        discounted_left = Histogram::exp_discount_value(current_b_left, d, df)
        discounted_right = Histogram::exp_discount_value(current_b_right, d, df)
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
        discounted_left = Histogram::exp_discount_value(current_b_left, d, df)
        discounted_right = Histogram::exp_discount_value(current_b_right, d, df)
        discounted = if d == 0 || d == max_distance then discounted_left else discounted_left + discounted_right end
        discounted
      }.map{|x| [x,v].min}.reduce(:+)
    }.reduce(:+)
    puts "similarity: #{similarity}" if debug
    difference
  end

  # self => Histogram
  # normalize so that sum is 1.0
  def normalize
    sum = @data.reduce(&:+)
    if sum > 0
      Histogram.new(@data.map{|x| x.to_f / sum}, @identifier)
    else
      self
    end
  end

  # self => string
  # string representation of a histogram
  def to_s
    "H(#{@data.map{|x| x.round(3)}.join ', '})"
  end

  # self, (float, boolean) => string
  # return a string representation of the histogram to be printend in the shell
  # representation is with horizontal bars
  def plot(size = 80, show_index = true)
    to_s + "\n" + (if @identifier then "[id: #{identifier}]\n" else '' end) + @data.map.with_index{|x,i|
      ("%02d: " % i) + '#' * (x.to_f / data.max * size).to_i + (if x > 0 then " (#{x.round(3)})" else "" end)
    }.join("\n")
  end

end
