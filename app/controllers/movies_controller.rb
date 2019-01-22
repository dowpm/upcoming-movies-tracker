class MoviesController < ApplicationController
    use Rack::Flash

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
        # raise params.inspect
        movie = Movie.find_by(name: params[:movie][:name])
        flash[:alert] = "Movie's alredy there"
        redirect '/movies/new' if movie
        genre = Genre.find_or_create_by(params[:genre])
        @movie = Movie.new params[:movie]
        @movie.genre = genre
        if @movie.save
            redirect '/movies'
        else
            erb :'/movies/new'
        end
    end
end