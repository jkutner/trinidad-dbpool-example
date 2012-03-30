require 'rubygems'
require 'sinatra'
require 'active_record'

get '/' do
  ActiveRecord::Base.establish_connection(
    :adapter => "jdbcpostgresql",
    :jndi => "java:/comp/env/jdbc/trinidad"
  )

  r = ActiveRecord::Base.connection.execute(
  	"select count(*) from pg_catalog.pg_tablespace")

  "Thing two found: #{r.inspect}"
end

run Sinatra::Application
