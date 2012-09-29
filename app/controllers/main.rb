require 'tilt/haml'
require '../app/models/trade/user'

class Main < Sinatra::Application

  get "/" do
    redirect '/login' unless session[:name]

    haml :list_users, :locals => { :time  => Time.now ,
                                   :users => Trade::User.all,
                                   :current_name => session[:name]}

  end


end