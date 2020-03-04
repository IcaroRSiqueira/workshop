class SolutionCommentsController < ApplicationController

  def create
    @solution = Solution.find(params[:solution_id])
    @user = current_user
    @comment = @solution.solution_comments.new(comment_params)
    if @comment.save
      flash[:notice] = 'Comentário enviado com sucesso'
      redirect_to challenge_solution_path(@solution.challenge, @solution)
    else
      flash[:alert] = ''
    end
  end

  private

  def comment_params
    params.require(:solution_comment).permit(:body).merge(user: @user)
  end
end