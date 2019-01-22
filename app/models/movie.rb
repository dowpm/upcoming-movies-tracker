class Movie < ActiveRecord::Base
    belongs_to :user
    belongs_to :genre
    validates :release_date, presence: true

    def genre_name
        genre.name 
    end
end