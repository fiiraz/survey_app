class Api::V1::SurveysController < ApplicationController
  before_action :find_survey, only: [:show, :create]

  def show
    render json: @survey,
           serializer: SurveySerializer,
           include: ['questions', 'questions.options']

  end

  def create
    Response.transaction do
      feedback = Feedback.new(survey: @survey)
      params[:answers].each do |answer|
        question = Question.find(answer[:question_id])
        if answer[:type] == "option"
          option = Option.find(answer[:option_id])
          response = Response.new(question: question, option: option, feedback: feedback)
        elsif answer[:type] == "text"
          response = Response.new(question: question, body: answer[:body], feedback: feedback)
        else
          return render json: { error: "question type is not supported" }, status: :unprocessable_entity
        end
        feedback.save!
        response.save!
      end
    end
  end

  private

  def find_survey
    @survey = Survey.find(params[:id])
  end
end