class Movie < ActiveRecord::Base
    belongs_to :user
    belongs_to :genre
    validates :release_date, presence: true
    validates :genre_id, presence: true

    def genre_name
        return "" unless genre
        genre.name 
    end
end