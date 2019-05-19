class LandmarksController < ApplicationController
  # add controller methods
  
  # show all landmarks
  get '/landmarks' do
    @landmarks = Landmark.all #define instance variable for view
    erb :'landmarks/index' #show all landmarks view (index)
  end

  # provide a blank form
  get '/landmarks/new' do
    @landmark = Landmark.new
    erb :'landmarks/new' #show bank landmark form
  end

  # create a new landmark, store it in database, redirect to singe page view
  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark]) #create new landmark
    redirect to "/landmarks/#{@landmark.id}" #redirect back to landmarks index page
  end

  # display a single landmark by id
  get '/landmarks/:id' do
    #gets params from url
    @landmark = Landmark.find(params[:id]) #define instance variable for view
    erb :'landmarks/show' #show single landmark view
  end

  # show a single landmark in edit view
  get '/landmarks/:id/edit' do

    @landmark = Landmark.find(params[:id]) #define intstance variable for view
    erb :'landmarks/edit' #show edit landmark view
  end


  # store edited data in database, page direct to single page view
  put '/landmarks/:id' do  
    @landmark = Landmark.find(params[:id]) #define variable to edit'
    @landmark.update(params[:landmark]) #assign new attributes
    
    redirect to "/landmarks/#{@landmark.id}"

    # erb :"landmarks/show"
  end

  delete '/landmarks/:id' do

    #get params from url
    @landmark = Landmark.find(params[:id]) #define landmark to delete
  
    @landmark.destroy #delete landmark
  
    redirect '/landmarks' #redirect back to landmarks index page
  
  end

end
