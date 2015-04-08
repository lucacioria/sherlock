#!env ruby

require 'awesome_print'
require 'pp'
require 'commander'

require_relative 'histogram'
require_relative 'analysis'
require_relative 'sherlock_db'
require_relative 'train'
require_relative 'sherlock_init'

include Math
include SherlockDb

class Sherlock
  include Commander::Methods

  def run
    program :name, 'sherlock'
    program :version, '0.1'
    program :description, 'temporal analysis of transaction on UBI databases'
    program :help, 'how to use', 'bla bla'

    command 'init' do |c|
      c.syntax = 'init profile-kinds'
      c.description = 'runs init scripts from the SherlockInit module'
      c.action do |args, options|
        case args[0]
        when 'profile-kinds'
          SherlockInit::reset_profiles_and_profile_kinds()
        else
          raise "unknown init sequence: #{args[0]}"
        end
      end
    end

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

    command 'create-profiles' do |c|
      c.syntax = 'init profile-kinds'
      c.description = 'create profiles for each profile kind'
      c.option '--user-id STRING', String
      c.option '--all'
      c.action do |args, options|
        raise 'specify a user-id or --all' if options.user_id.nil? and !options.all
        if options.all
          Train::save_all_profiles()
        else
          Train::save_all_profiles_for_user(options.user_id)
        end
      end
    end

    command :test do |c|
      c.action do |args, options|
        pp Train::create_all_profiles_for_user('002bce3fc82152b2aa23a0d955fd9603')
      end
    end

    run!
  end
end

Sherlock.new.run if $0 == __FILE__
