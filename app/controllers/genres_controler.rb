class GenresController < ApplicationController
    use Rack::Flash
    
    get '/genres/:id' do
        require_logged_in
        @genre = Genre.find_by id: params[:id]
        if @genre
            @movies = @current_user.movies.where(genre: @genre)
            erb :'genres/show_genre'
        else
            flash[:alert] = "Cannot find this genre"
            redirect '/movies'
        end
    end
end