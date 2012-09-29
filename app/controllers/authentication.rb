require 'tilt/haml'
require '../models/trade/user'


class Authentication < Sinatra::Application

  get "/login" do
    haml :login
  end

  post "/login" do
    name = params[:username]
    password = params[:password]

    fail "Empty username or password" if name.nil? or password.nil?

    student = Trade::User.by_name(name)

    fail "Username or password are not valid" if user.nil? or password != name

    session[:name] = name
    redirect '/'
  end

  get "/logout" do
    session[:name] = nil
    redirect '/login'
  end


end