class UsersController < ApplicationController

  before_action :set_user, only: [:edit_profile]

  def edit_profile


  end


  private

  def set_user
    @user = User.find(params[:id] || params[:user_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :description, :starts_on, :ends_on,:image)
  end

  def profile_params
    params.require(:user).permit(:twitter_handle, :phone_number, :location,:quora_handle, :email, :first_name, :last_name)
  end

  def profile_update_params
    params.require(:user).permit(:twitter_handle, :phone_number, :location,:quora_handle, :email, :first_name, :last_name)
  end


end
