class MembershipsController < ApplicationController
    def index
        memberships = Membership.all
        render json: memberships
    end

    def create
        membership = Membership.create(membership_params)
        if membership.valid?
            render json: membership
        else
            render json: membership.errors
        end
    end

    def update
        membership = Membership.find(params[:id])
        membership.update(membership_params)
        if membership.valid?
            render json: membership
        else
            render json: membership.errors
        end
    end

    def destroy
        membership = Membership.find(params[:id])
        memberships = Membership.all
        if membership.destroy
            render json: memberships, status: 204
        else
            render json: membership.errors
        end
    end

    private
    def membership_params
        params,require(:membership).permit(:user_id, :club_id, :name)
end
