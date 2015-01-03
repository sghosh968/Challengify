class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]

  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.all
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
  end

  # GET /challenges/1/edit
  def edit
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @start = DateTime.strptime(params[:challenge][:c_start], '%Y/%m/%d %H:%M')
    @end = DateTime.strptime(params[:challenge][:c_end], '%Y/%m/%d %H:%M')
    params[:challenge]["starts_on(1i)"] = @start.year.to_s
    params[:challenge]["starts_on(2i)"] = @start.month.to_s
    params[:challenge]["starts_on(3i)"] = @start.day.to_s
    params[:challenge]["starts_on(4i)"] = @start.hour.to_s
    params[:challenge]["starts_on(5i)"] = @start.min.to_s

    params[:challenge]["ends_on(1i)"] = @end.year.to_s
    params[:challenge]["ends_on(2i)"] = @end.month.to_s
    params[:challenge]["ends_on(3i)"] = @end.day.to_s
    params[:challenge]["ends_on(4i)"] = @end.hour.to_s
    params[:challenge]["ends_on(5i)"] = @end.min.to_s

    @challenge = Challenge.new(challenge_params)

    respond_to do |format|
      if @challenge.save
        current_user.add_role :owner, @challenge
        format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
        format.json { render :show, status: :created, location: @challenge }
      else
        format.html { render :new }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { render :show, status: :ok, location: @challenge }
      else
        format.html { render :edit }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url, notice: 'Challenge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #get challenges created by current_user

  def my_challenges
    @my_challenges = Challenge.with_role(:owner, current_user)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.require(:challenge).permit(:name, :description, :starts_on, :ends_on)
    end
end
