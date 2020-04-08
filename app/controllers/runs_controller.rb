class RunsController < ApplicationController

  # GET: /runs
  get "/runs" do
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
        @run = current_user.runs.build(date: date, duration: params[:duration], distanace: params[:distance], pace: params[:pace])
        if @run.save
          redirect.to "/runs"
        else
          redirect to "/runs/new"
        end
      end
    else
      reditrect to "/users/login"
    end
  end


  # GET: /runs/5
  get "/runs/:id" do
    erb :"/runs/show.html"
  end

  # GET: /runs/5/edit
  get "/runs/:id/edit" do
    erb :"/runs/edit.html"
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
