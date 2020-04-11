class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    @user = User.new
    @user.email = params[:email]
    @user.username = params[:username]
    @user.password = params[:password]
    if @user.save
      login(params[:username], params[:password])
      redirect to "/runs"
    else
      erb :"users/new.html"
    end

  end

  get "/users/login" do 
    erb :"users/login.html"
  end 

  post "/users/login" do 
    login(params[:username], params[:password])
    redirect to "/runs"
  end

  get "/users/logout" do
    if logged_in?
      session.destroy
      redirect to "users/login"
    else
      redirect to '/'
    end
  end 
end
