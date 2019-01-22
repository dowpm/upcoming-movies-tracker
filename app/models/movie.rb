class Movie < ActiveRecord::Base
    belongs_to :user
    belongs_to :genre
    validates :release_date, presence: true
end