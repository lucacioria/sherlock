#!env ruby

include Math
require 'active_record'
require 'awesome_print'
require 'mysql2'
require 'pp'
require 'commander'
require_relative 'histogram'
require_relative 'test'
require_relative 'analysis'

ActiveSupport::Inflector.inflections do |inflect|
  inflect.clear
  inflect.singular(/$/i, '')
end

ActiveRecord::Base.establish_connection(
  adapter:  'mysql2', # or 'postgresql' or 'sqlite3'
  database: 'banksealer',
  username: 'root',
  host:     'localhost'
)

class UserHourOfDay < ActiveRecord::Base; end
class Bonifici < ActiveRecord::Base; end
class UserHourAnomaly < ActiveRecord::Base; end

=begin
anal = {}

# distincts
anal['distincts'] = {}
Bonifici.columns.each {|column|
  distincts = Bonifici.distinct.pluck(column.name)[0..20]
  anal['distincts'][column.name] = distincts.map {|d| [d, Bonifici.where({column.name => d}).count]}
}
=end

class Sherlock
  include Commander::Methods

  def run
    program :name, 'sherlock'
    program :version, '0.1'
    program :description, 'temporal analysis of transaction on UBI databases'
    program :help, 'how to use', 'bla bla'

    command 'run-sql' do |c|
      c.syntax = 'run-sql clean'
      c.description = 'creates the transfers table taking data from the bonifici table'
      c.action do |args, options|
        puts `mysql --user root banksealer < sql/#{args[0]}.sql`
      end
    end

    command :anal do |c|
      available_anal = ["hour"]
      c.option '--analysis STRING', String, "analysis to perform: #{available_anal.join(', ')}"
      c.option '--userId STRING', String, 'userId'
      c.option '--save'
      c.action do |args, options|
        raise "userId not specified" if options.userId.nil? && !options.save
        case options.analysis
        when "hour"
          if options.save
            save_hour_analysis
          else
            hour_analysis(options.userId, !options.plot.nil?)
          end
        else
          puts "analysis not recognized, available analysis: #{available_anal.join(', ')}"
        end
      end
    end

    command :test do |c|
      c.action do |args, options|
        # puts [0.5, 1, 2].map{|df| discount(10, 1, df)}
        asdf()
      end
    end

    run!
  end
end

Sherlock.new.run if $0 == __FILE__
