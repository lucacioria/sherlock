def self_zip(x)
  ([nil] + x).zip(x + [nil])[1...-1]
end

def discount(value, steps, discount_factor)
  value * exp(-discount_factor * steps)
end

def discounted_anomaly(past, current, distance_function, discount_factor)
  distances = past.map{|x| distance_function.call(current, x)}
  discount_factors = distances.map.with_index{|_, i| discount(1, i, discount_factor)}.reverse
  discounted_distances = distances.map.with_index{|d, i| d * discount_factors[i]}
  discounted_distance = discounted_distances.reduce(:+) / discount_factors.reduce(:+)
  #puts "distances without discount"
  #puts distances
  #puts "..with discount"
  #puts discounted_distance
  discounted_distance
end

def anomaly_over_time(objects, distance_function, discount_factor)
  objects[1..-1].map.with_index{|o, i| discounted_anomaly(objects[0..i], o, distance_function, discount_factor)}
end


def asdf
  records = UserHourOfDay.where(userId: '079fee0af27f1d2a688020b0dc34d9b4')
  histograms = records.group_by{|x| x.month}.map{|k,v|
    values_with_gaps = v.map{|y| {y.hour => y.count}}.reduce(:merge)
    # fill empty hours with count 0
    values_without_gaps = (0..23).to_a.map{|y|{y => 0}}.reduce(:merge).merge(values_with_gaps)
    Histogram.new(values_without_gaps.sort.map(&:second))
  }
  #puts discounted_anomaly(histograms[0...-1], histograms[-1], Histogram.method(:distance1), 1)
  puts anomaly_over_time(histograms, Histogram.method(:distance1), 1)
end

def hour_analysis(userId, plot = false)
  records = UserHourOfDay.where(userId: userId)
  histograms = records.group_by{|x| x.month}.map{|k,v|
    values_with_gaps = v.map{|y| {y.hour => y.count}}.reduce(:merge)
    # fill empty hours with count 0
    values_without_gaps = (0..23).to_a.map{|y|{y => 0}}.reduce(:merge).merge(values_with_gaps)
    Histogram.new(values_without_gaps.sort.map(&:second), k)
  }
  distance_function = ->(a, b) {Histogram.distance2_circular(a, b, 1)}
  anomalies = anomaly_over_time(histograms, distance_function, 1)
  histograms[1..-1].map(&:identifier).zip(anomalies).map(&:flatten).map{|x| {userId: userId, month: x[0], anomaly: x[1]}}
  #distances.each{|x|
    #plots = x[0].map{|y|y.plot(70)}.map{|y|y.split("\n").map{|line| line.ljust(87, ' ')}}
    #plots_side_by_side = plots[0].zip(plots[1]).map{|y| y[0]+y[1]}
    #puts plots_side_by_side if plot
    #puts "distance: #{x[1]}\n\n"
  #}

end

def save_hour_analysis
  userIds = UserHourOfDay.distinct.pluck('userId')
  count = 0
  userIds.each{|userId|
    analysis = hour_analysis(userId)
    UserHourAnomaly.create(analysis)
    puts count if count % 1000 == 0
    count = count + 1
  }
end
