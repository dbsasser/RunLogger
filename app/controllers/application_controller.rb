require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "runlogger"
  end

  get "/" do
    erb :welcome
  end

  helpers do 

    def login(username, password)
      user = User.find_by(:username => username)
      if user && user.authenticate(password)
        session[:user_id] = user.id
      else
        redirect '/users/login'
      end 
    end


    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find_by_id(session[:user_id]) if logged_in?
    end

  end

end
