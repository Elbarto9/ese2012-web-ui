require 'tilt/haml'
require '../app/models/trade/user'


class Authentication < Sinatra::Application

  get "/login" do
    haml :login
  end

  post "/login" do
    name = params[:username]
    password = params[:password]

    if name.nil? or password.nil?
      redirect '/login'
    end

    user = Trade::User.by_name(name)

    if user.nil? or password != name
      redirect '/login'
    end

    session[:name] = name
    redirect '/'
  end

  get "/logout" do
    session[:name] = nil
    redirect '/login'
  end

end