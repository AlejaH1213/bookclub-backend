class ClubsController < ApplicationController
    def index
        clubs = Club.all
        render json: clubs
    end

    def create
        club = Club.create(club_params)
        if club.valid?
            render json: club
        else
            render json: club.errors, status: 422
        end
    end

    def update
        club = Club.find(params[:id])
        if club.update(club_params)
          render json: club
        else
          render json: club.errors, status: 422
        end
    end

    
    private
    def club_params
        params.require(:club).permit(:name, :summary, :meeting_dates, :book_of_the_month, :book_of_the_month_picture)
    end
end
