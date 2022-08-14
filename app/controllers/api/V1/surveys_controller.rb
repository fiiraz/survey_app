class Api::V1::SurveysController < ApplicationController
  before_action :answer_params, only: %i[show create]
  before_action :find_survey, only: %i[show create]
  before_action :errors, only: %i[create]

  def show
    render json: @survey,
           serializer: SurveySerializer,
           include: ["questions", "questions.options"]
  end

  def create
    responses = build_responses

    return render json: @errors, status: :unprocessable_entity if @errors.any?

    Response.transaction do
      @feedback.save!
      responses.each do |response|
        render json: response.errors, status: :unprocessable_entity unless response.save!
      end
    end
  end

  private

    def find_survey
      @survey = Survey.find(params[:id])
    end

    def answer_params
      @params = params.permit(:id, :survey,
                              answers: %i[question_id option_id body])[:answers]
    end

    def build_responses
      @feedback = Feedback.new(survey: @survey)
      @params.map do |answer|
        answer[:feedback] = @feedback
        response = Response.new(answer)
        unless response.valid?
          @errors << { errors: response.errors, status: :unprocessable_entity, answer: }
        end
        response
      end
    end

    def errors
      @errors ||= []
    end
end
