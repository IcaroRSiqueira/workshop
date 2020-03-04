class SolutionsController < ApplicationController
  def index
    @challenge = Challenge.find(params[:challenge_id])
    @solutions = @challenge.solutions
  end

  def new
    @challenge = Challenge.find(params[:challenge_id])
    @solution = Solution.new
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @user = current_user
    @solution = @challenge.solutions.new(solution_params)
    if @solution.save
      flash[:notice] = 'Resposta enviada com sucesso'
      redirect_to challenge_solution_path(@challenge, @solution)
    else
      flash[:alert] = 'Não foi possível cadastrar sua resposta'
      render :new
    end
  end

  def show
    @challenge = Challenge.find(params[:challenge_id])
    @solution = Solution.find(params[:id])
    @comments = @solution.solution_comments
    @comment = SolutionComment.new
  end

  private

  def solution_params
    params.require(:solution).permit(:result).merge(user: @user)
  end
end