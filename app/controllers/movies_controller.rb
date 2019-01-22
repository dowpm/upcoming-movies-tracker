class MoviesController < ApplicationController
    get '/movies' do
        @movies = Movie.all
        erb :'movies/index'
    end

    get '/movies/new' do
        @movie = Movie.new(user_id: session[:user_id])
        if logged_in?
            erb :'movies/new'
        else
            redirect to '/login'
        end
    end
end