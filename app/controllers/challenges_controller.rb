class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end
  
  def show
    @challenge = Challenge.find(params[:id])
    @solution = @challenge.solutions.where(user: current_user)
    @comment = @challenge.challenge_comments.new
    @comments = @challenge.challenge_comments.all
  end
end