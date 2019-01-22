class Movie < ActiveRecord::Base
    belongs_to :user
    validates :release_date, presence: true
end