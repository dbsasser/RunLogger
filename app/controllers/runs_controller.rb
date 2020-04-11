class RunsController < ApplicationController

  # GET: /runs
  get "/runs" do
    if logged_in? 
      @runs = Run.where(:user_id => current_user.id).order("date DESC")
      erb :"/runs/index.html"
    else
      redirect to "/users/login"
    end
  end

  # GET: /runs/new
  get "/runs/new" do
    if logged_in? 
      erb :"/runs/new.html"
    else
      redirect to "/users/login"
    end
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
      redirect to "users/login"
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
    if logged_in?
      if params[:year] == "" || params[:month] == "" || params[:day] == "" || params[:duration] == "" || params[:distance] == "" || params[:pace] == ""
        redirect to "runs/#{params[:id]}/edit" 
      else
        @run = Run.find_by_id(params[:id])
        date = Time.new(params[:year].to_i, params[:month].to_i, params[:day].to_i)
        if @run && @run.user == current_user
          if @run.update(date: date, duration: params[:duration], distance: params[:distance], pace: params[:pace])
            redirect to "/runs/#{@run.id}"
          else 
            redirect to "/runs/#{@run.id}/edit"
          end
        else
          redirect to "/runs"
        end
      end
    else
      redirect to "/users/login"
    end
  end

    
 

  # DELETE: /runs/5/delete
  delete "/runs/:id/delete" do
    redirect "/runs"
  end
end
