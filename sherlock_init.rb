module SherlockInit

  def self.reset_profiles_and_profile_kinds
    ProfileKinds.connection.execute('truncate table profile_kinds')
    Profiles.connection.execute('truncate table profiles')

    ProfileKinds.create({name: 'amount', config:{
      number_of_bins: 20,
      type: 'float',
      max_value: 50000.0,
      min_value: 0.0,
      field: 'amount',
      binning: 'log',
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
