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
    Trade::User.named( 'Oscar' ).save()
    Trade::User.named( 'Urs' ).save()
    Trade::User.named( 'Konstantin').save()
  end

end

# Now, run it
App.run!