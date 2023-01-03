class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update show destroy edit]
  def create
     @question = Question.create(question_params)

    redirect_to question_path(@question), notice: 'Successfully created!'
  end

  def update
    @question.update(question_params)

    redirect_to question_path(@question), notice: 'Successfully saved!'
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: 'Successfully deleted!'
  end

  def show
  end

  def index
    @questions = Question.all 
    @question = Question.new     
  end

  def new
    @question = Question.new
  end

  def edit    
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
  