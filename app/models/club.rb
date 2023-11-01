class Club < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships
    validates :name, :summary, :meeting_dates, :book_of_the_month, :book_of_the_month_picture, presence: true
end
