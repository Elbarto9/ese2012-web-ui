require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'tilt/haml'
require '../app/models/trade/user'
require '../app/controllers/main'
require '../app/controllers/authentication'

class App < Sinatra::Base

  use Authentication
  use Main

  enable :sessions
  set :public_folder, 'app/public'

  configure :development do
    oscar = Trade::User.named( 'Oscar' )
    oscar.save
    oscar.create_item('Computer', 1000).activate
    urs = Trade::User.named( 'Urs' )
    urs.save
    urs.create_item('Nintendo', 200).activate
    konstantin = Trade::User.named( 'Konstantin')
    konstantin.save
    konstantin.create_item('XBOX', 250).activate
  end

end

# Now, run it
App.run!