require_relative 'histogram'
require 'pp'

[0.5,1,2].each {|sigma|
  puts
  puts
  puts "sigma: #{sigma}"
  a = Histogram.new([1,5,7,2,3,9,2])
  b = Histogram.new([0,3,6,2,1,2,1])

  as = a.gaussian_smooth(sigma)
  bs = b.gaussian_smooth(sigma)

  pp as.data.map{|x|x.round(1)}
  pp bs.data.map{|x|x.round(1)}

  puts "distance smoothed: #{as.distance_euclidean bs}"
  puts "distance non smoothed: #{a.distance_euclidean b}"
}
