class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all #define instance variable for view
    erb :'figures/index' #show all figures view (index)
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
      # binding.pry
    erb :'figures/new' #show new figures view
  end

  post '/figures' do
    #below works with properly formatted params in HTML form
    @figure = Figure.new(params[:figure]) #create new figure
        # if params[figure.title_name] == nil && params[figure.landmark_name == nil]
    if @figure.save #saves new figure or returns false if unsuccessful
      redirect '/figures' #redirect back to figures index page
    else
      erb :'figures/new' # show new figures view again(potentially displaying errors)
    end
  end

  get '/figures/:id' do
    #gets params from url
    @figure = Figure.find(params[:id]) #define instance variable for view
    erb :'figures/show' #show single figure view
  end

  get '/figures/:id/edit' do
    #get params from url
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find(params[:id]) #define intstance variable for view
    erb :'figures/edit' #show edit figure view
  end

  put '/figures/:id' do

  #get params from url
  @figure = Figure.find(params[:id]) #define variable to edit
  @figure.assign_attributes(params[:figure]) #assign new attributes
  if @figure.save #saves new figure or returns false if unsuccessful
    redirect '/figures' #redirect back to figures index page
  else
    erb :'figures/edit' #show edit figure view again(potentially displaying errors)
  end
end

delete '/figures/:id' do
#get params from url
@figure = Figure.find(params[:id]) #define figure to delete
@figure.destroy #delete figure
redirect '/figures' #redirect back to figures index page
end


end
