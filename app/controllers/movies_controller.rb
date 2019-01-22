class MoviesController < ApplicationController
    use Rack::Flash

    get '/movies' do
        @active_profile = 'active'
        require_logged_in
        # @movies = @current_user.movies
        @movies = @current_user.movies
        erb :'movies/index'
    end

    get '/movies/new' do
        require_logged_in
        @movie = @current_user.movies.build
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
        
        movie = @current_user.movies.find_by(name: params[:movie][:name])
        if movie
            flash[:alert] = "#{movie.name}'s alredy there"
            redirect '/movies/new'
        end

        @movie = @current_user.movies.build params[:movie]

        @movie.genre = Genre.find_or_create_by(params[:genre]) unless params[:genre][:name].empty?

        if @movie.save
            redirect '/movies'
        else
            @genres = Genre.all
            erb :'/movies/new'
        end
    end

    get '/movies/edit/:id' do
        require_logged_in
        @movie = @current_user.movies.find_by(id: params[:id])
        if @movie
            @genres = Genre.all
            erb :'movies/edit'
        else
            redirect '/movies'
        end
    end

    put '/movies/:id' do
        require_logged_in
        @movie = @current_user.movies.find_by(id: params[:id])
        if @movie
            @movie.genre = Genre.find_or_create_by(params[:genre]) unless params[:genre][:name].empty?
            if @movie.update(params[:movie])
                redirect '/movies'
            else
                erb :'movies/edit'
            end
        else
            redirect '/movies'
        end
    end
end