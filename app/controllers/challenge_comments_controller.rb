class ChallengeCommentsController < ApplicationController

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @user = current_user
    @comment = @challenge.challenge_comments.new(comment_params)
    if @comment.save
      flash[:notice] = 'Comentário enviado com sucesso'
      redirect_to @challenge
    else
      flash[:alert] = ''
    end
  end

  private

  def comment_params
    params.require(:challenge_comment).permit(:body).merge(user: @user)
  end
end