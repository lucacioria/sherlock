require_relative 'histogram'
require 'pp'

def sum(h, b, e)
  h.data[b...e].reduce(:+)
end

def variance(h)
  d = h.data
  sum = d.reduce(:+)
  avg = sum / d.length
  d.map{|x| (x - avg) ** 2}.reduce(:+) / d.length
end

(5..20).each {|length|
  100.times do
    h = Histogram.new(Array.new(length).map{rand(0..20)})
    j = Histogram.new(Array.new(length).map{rand(0..20)})
    h_s = h.gaussian_smooth(0.5)
    j_s = j.gaussian_smooth(0.5)
    d = h.distance_euclidean(j)
    d_s = h_s.distance_euclidean(j_s)
    if d_s > d then
      puts "violation"
    end
    #start = 0
    #size = 10
    #h_a = sum(h,start,start+size)
    #h_b = sum(h,start+size+1,start+size+1+size)
    #s_a = sum(s,start,start+size)
    #s_b = sum(s,start+size+1,start+size+1+size)
    #if variance(h) < variance(s)
      #puts "violation"
    #end
    #if  h_a < h_b && s_a > s_b
       #puts "violation"
       #puts h
       #puts s
       #puts h_a, h_b, s_a, s_b
    #end

  end
}



#[0.5,1,2].each {|sigma|
  #puts
  #puts
  #puts "sigma: #{sigma}"
  #a = Histogram.new([1,5,7,2,3,9,2])
  #b = Histogram.new([0,3,6,2,1,2,1])

  #as = a.gaussian_smooth(sigma)
  #bs = b.gaussian_smooth(sigma)

  #pp as.data.map{|x|x.round(1)}
  #pp bs.data.map{|x|x.round(1)}

  #puts "distance smoothed: #{as.distance_euclidean bs}"
  #puts "distance non smoothed: #{a.distance_euclidean b}"
#}
