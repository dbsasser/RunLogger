class RunsController < ApplicationController

  # GET: /runs
  get "/runs" do
    @runs = Run.where(:user_id => current_user.id).order("date DESC")
    erb :"/runs/index.html"
  end

  # GET: /runs/new
  get "/runs/new" do
    erb :"/runs/new.html"
  end

  # POST: /runs
  post "/runs" do
    if logged_in?
      if params[:year] == "" || params[:month] == "" || params[:day] == "" || params[:duration] == "" || params[:distance] == "" || params[:pace] == ""
        redirect to "runs/new" 
      else
        date = Time.new(params[:year].to_i, params[:month].to_i, params[:day].to_i)
        @run = current_user.runs.build(date: date, duration: params[:duration], distance: params[:distance], pace: params[:pace])
        if @run.save
          redirect to "/runs"
        else
          redirect to "/runs/new"
        end
      end
    else
      redirect to "/users/login"
    end
  end


  # GET: /runs/5
  get "/runs/:id" do
    if logged_in?
      @run = Run.find_by_id(params[:id])
      erb :"/runs/show.html"
    else
      redirect to '/login'
    end
  end

  # GET: /runs/5/edit
  get "/runs/:id/edit" do
    if logged_in?
      @run = Run.find_by_id(params[:id])
      if @run && @run.user == current_user
        erb :"/runs/edit.html"
      else
        redirect to "/runs"
      end
    else
      redirect to "/users/login"
    end
  end

  # PATCH: /runs/5
  patch "/runs/:id" do
    redirect "/runs/:id"
  end

  # DELETE: /runs/5/delete
  delete "/runs/:id/delete" do
    redirect "/runs"
  end
end
