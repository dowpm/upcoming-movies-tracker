class MoviesController < ApplicationController
    get '/movies' do
        @movies = Movie.all
        erb :'movies/index'
    end

    get '/movies/new' do
        # @movie = Movie.new(user_id: session[:user_id])
        @genres = Genre.all
        if logged_in?
            erb :'movies/new'
        else
            redirect to '/login'
        end
    end

    post '/movies' do
        raise params.inspect
    end
end