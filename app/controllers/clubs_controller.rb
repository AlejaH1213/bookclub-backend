class ClubsController < ApplicationController
    def index
        clubs = Club.all
        render json: clubs
    end
end
