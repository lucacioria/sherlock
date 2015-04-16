module SherlockInit

  ##
  # binning can be linear, log, custom_intervals, categorical
  #
  # *linear*: equally wide bins
  #
  # *log*: logarithmically spaced bins
  #
  # *custom_intervals*: custom defined intervals, bound between min_value and max_value
  #
  #     intervals: [float] array of steps, min and max are implicit (eg: array length 2 => 3 bins)
  #
  # *categorical*: custom defined categories, all strings that don't match end up in a catch 'em
  #                all bin at the end
  #
  #     categories: [[string]] array of arrays of string (set of values mapped to the same bin)
  #
  # windows_size => size of the sliding window to compute distances, in months. default 3
  # smooth => wether to smooth or not before computing distance, default false
  # sigma => value of sigma in gaussian smoothing, default 1
  # circular => wether the smoothing will be circular (for circular histograms such as hour of the
  #   day), default false
  # discount_factor => exponential discount factor in distance computation, default 0.5

  def self.reset_profiles_and_profile_kinds
    ProfileKinds.connection.execute('truncate table profile_kinds')
    Profiles.connection.execute('truncate table profiles')


    ProfileKinds.create({name: 'amount', config:{
      type: 'float',
      field: 'amount',
      binning: 'custom_intervals',
      window_size: 3,
      smooth: true,
      sigma: 1,
      circular: false,
      discount_factor: 2,
      intervals: [100, 200, 300, 450, 600, 900, 1200, 1700, 3300, 4000, 5000, 6500, 10000, 20000]
    }})

    ProfileKinds.create({name: 'transfer_type', config:{
      type: 'string',
      field: 'transfer_type',
      binning: 'categorical',
      categories: [['Giroconto'], ['Bonifici Italia e SEPA']]
    }})

    ProfileKinds.create({name: 'hour', config:{
      number_of_bins: 24,
      type: 'float',
      max_value: 24.0,
      min_value: 0.0,
      field: 'hour',
      binning: 'linear',
    }})
  end

end
