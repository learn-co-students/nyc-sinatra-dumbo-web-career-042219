class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
  @landmark = Landmark.all #define instance variable for view
  erb :'landmarks/index' #show all landmark view (index)
end

get '/landmarks/new' do
  @figures = Figure.all
  erb :'landmarks/new' #show new landmarks view
end

post '/landmarks' do
  #below works with properly formatted params in HTML form
  @landmark = Landmark.create(params[:landmark]) #create new landmark
  if @landmark.save #saves new landmark or returns false if unsuccessful
    redirect '/landmarks' #redirect back to landmarks index page
  else
    erb :'landmarks/new' # show new landmarks view again(potentially displaying errors)
  end
end

get '/landmarks/:id' do
  #gets params from url
  @landmark = Landmark.find(params[:id]) #define instance variable for view
  erb :'landmarks/show' #show single landmark view
end

get '/landmarks/:id/edit' do
  #get params from url
  @figures = Figure.all
  @landmark = Landmark.find(params[:id]) #define intstance variable for view
  erb :'landmarks/edit' #show edit landmark view
end

put '/landmarks/:id' do
  #get params from url
  @landmark = Landmark.find(params[:id]) #define variable to edit
  @landmark.assign_attributes(params[:landmark]) #assign new attributes
  if @landmark.save #saves new landmark or returns false if unsuccessful
    redirect '/landmarks' #redirect back to landmarks index page
  else
    erb :'landmarks/edit' #show edit landmark view again(potentially displaying errors)
  end
end

delete '/landmarks/:id' do
  #get params from url
  @landmark = Landmark.find(params[:id]) #define landmark to delete
  @landmark.destroy #delete landmark
  redirect '/landmarks' #redirect back to landmarks index page
end

end
