class Api::V1::SurveysController < ApplicationController
  before_action :find_survey, only: %i[show create]

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
        case answer[:type]
        when 'option'
          option = Option.find(answer[:option_id])
          response = Response.new(question:, option:, feedback:)
        when 'text'
          response = Response.new(question:, body: answer[:body], feedback:)
        else
          return render json: { error: 'question type is not supported' }, status: :unprocessable_entity
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
