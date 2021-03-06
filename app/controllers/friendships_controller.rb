class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy, :process_friendship_request]

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

  # action to process friendship requests
  def process_friendship_request
     if params["process"] == "accept"
       #@friendship.update(:status => "Accepted")
       flash[:notice => "Friendship Request accepted"]
     elsif params["process"] == "reject"
       #@friendship.update(:status => "Rejected")
       flash[:notice => "Friendship Request rejected"]
     end
    respond_to do |format|
      format.js
    end
  end

  private
    def set_friendship
      @friendship = Friendship.find(params[:id] || params[:friendship_id])
    end

    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :status)
    end
end
