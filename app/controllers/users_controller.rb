class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
      @users = current_user.nearbys(2000) || User.near("Miami", 200)
    end

    def show
      @games = @user.games.all
    end

    def edit
    end

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :zip, :address, :country, :dob, :fb, :psn, :xbox, :steam, :twitch, :bio, :profile_img)
    end
end
