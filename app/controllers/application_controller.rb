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
        session[:id] = user.id
      else
        redirect '/user/login'
      end 
    end
  end

end
