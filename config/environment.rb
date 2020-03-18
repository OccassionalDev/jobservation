ENV['SINATRA_ENV'] ||= "development"

require 'bundler'
Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do 
    set :database, 'sqlite3:db/database.db'
end 

require_all "app"