ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'helpers'
require_relative 'server'
require_relative 'controllers/space_controller'
require_relative 'controllers/user_controller'
require_relative 'controllers/session_controller'
require_relative 'controllers/request_controller'
