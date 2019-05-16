class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    # binding.pry
    @figure = Figure.create(params[:figure])
    if !params['title'][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    if !params['landmark'][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    redirect "figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @titles = Title.all
    @landmarks = Landmark.all
    @figure_titles = FigureTitle.where(figure_id: params[:id])
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  put '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params['title'][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    if !params['landmark'][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    redirect "figures/#{@figure.id}"
  end

end
