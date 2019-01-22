class MoviesController < ApplicationController
    use Rack::Flash

    get '/movies' do
        @movies = Movie.all
        erb :'movies/index'
    end

    get '/movies/new' do
        @movie = Movie.new()
        @genres = Genre.all
        if logged_in?
            erb :'movies/new'
        else
            redirect to '/login'
        end
    end

    post '/movies' do
        # raise params.inspect
        require_logged_in

        movie = Movie.find_by(name: params[:movie][:name])
        if movie
            flash[:alert] = "#{movie.name}'s alredy there"
            redirect '/movies/new'
        end

        @movie = Movie.new params[:movie]

        @movie.genre = Genre.find_or_create_by(params[:genre]) unless params[:genre][:name].empty?

        if @movie.save
            @current_user.movies << @movie
            redirect '/movies'
        else
            @genres = Genre.all
            erb :'/movies/new'
        end
    end
end