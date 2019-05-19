class FiguresController < ApplicationController
  # add controller methods

  # show all the figures
  get '/figures' do
    @figures = Figure.all
  
    erb :'figures/index'
  end

  # show a blank form for new figure
  get '/figures/new' do
    @figure = Figure.new
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new' 
  end

  # show a single figure page
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    @landmarks = @figure.landmarks
    @titles = @figure.titles
    erb :'figures/show'
  end

  # create and post new figure data
  post '/figures' do
    @figure = Figure.create(params[:figure])  # must use params[:figure] if use _form.erb partial
    redirect to "figures/#{@figure.id}"
  end

  # show a figure data on an edit page
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id]) #get params from url and define intstance variable for view
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/edit'   #show edit figure view
  end

  # Update a figure data
  put '/figures/:id' do
    #get params from url
    @figure = Figure.find(params[:id]) #define variable to edit
    @figure.update(params[:figure]) #assign new attributes to found id, can use assign_attributes
    redirect "figures/#{@figure.id}"
  end

  delete '/figures/:id' do
    @student = Student.find(params[:id])
    @student.destroy
    redirect 'students'
  end

end
