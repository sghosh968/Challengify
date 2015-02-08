class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @friendships = current_user.friendships
    respond_with(@friendships)
  end

  def show
    respond_with(@friendship)
  end

  def new
    @friendship = Friendship.new
    respond_with(@friendship)
  end

  def edit
  end

  def create
    @friendship = Friendship.new(friendship_params)
    flash[:notice] = 'Friendship was successfully created.' if @friendship.save
    respond_with(@friendship)
  end

  def update
    flash[:notice] = 'Friendship was successfully updated.' if @friendship.update(friendship_params)
    respond_with(@friendship)
  end

  def destroy
    @friendship.destroy
    respond_with(@friendship)
  end

  private
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :status)
    end
end
