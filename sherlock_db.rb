module SherlockDb

  require 'mysql2'
  require 'active_record'

  # disable pluralization for god sake
  ActiveSupport::Inflector.inflections do |inflect|
    inflect.clear
    inflect.singular(/$/i, '')
  end

  # hardcoded DB connection dude
  ActiveRecord::Base.establish_connection(
    adapter:  'mysql2', # or 'postgresql' or 'sqlite3'
    database: 'banksealer',
    username: 'root',
    host:     'localhost'
  )

  # table mappings
  class UserHourOfDay < ActiveRecord::Base; end

  class Bonifici < ActiveRecord::Base; end

  class UserHourAnomaly < ActiveRecord::Base; end

  class Transfers < ActiveRecord::Base; end

  class Profiles < ActiveRecord::Base
    serialize :histogram
  end

  class ProfileKinds < ActiveRecord::Base
    serialize :config
  end

end
