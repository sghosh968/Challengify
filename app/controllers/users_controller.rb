class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update]

  def edit

  end
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_user_path, notice: 'Your Profile was successfully updated.' }
        #format.json { render :show, status: :ok, location: @challenge }
      else
        format.html { render :edit }
        #format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end

  end


  private

  def set_user
    @user = User.find(params[:id] || params[:user_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:image,:name, :description, :starts_on, :ends_on,:email, :username, :password,:password_confirmation ,:first_name, :last_name, :about, :phone, :website, :facebook_url, :twitter_url)
  end



end
