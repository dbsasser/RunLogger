require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "runlogger"
  end

  get "/" do
    if logged_in?
      redirect to "/runs"
    else
      erb :welcome
    end
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

    def valid_date?
      if params[:month].to_i.between?(1,12) && params[:day].to_i.between?(1,31) && params[:year].to_i.between?(1900,2200)
        true
      else
        false
      end
    end 

  end

end
