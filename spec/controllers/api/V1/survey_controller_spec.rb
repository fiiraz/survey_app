require "rails_helper"

describe Api::V1::SurveysController do
  let!(:survey) { create(:survey) }
  let!(:question) do
    create(:question, survey_id: survey.id, question_type: 1, title: "test question")
  end
  let!(:option_one) { create(:option, question_id: question.id, title: "test option1") }
  let!(:option_two) { create(:option, question_id: question.id, title: "test option2") }

  describe "Get #survey" do
    it "renders survey json" do
      get :show, params: { id: survey.id }
      expect(response).to be_successful
      p response.body
      expect(parsed_response_body["name"]).to eq("test survey")
      expect(parsed_response_body["questions"][0]["title"]).to eq("test question")
      expect(parsed_response_body["questions"][0]["question_type"]).to eq("choice")
      expect(parsed_response_body["questions"][0]["options"][0]["title"]).to eq("test option1")
      expect(parsed_response_body["questions"][0]["options"][1]["title"]).to eq("test option2")
    end
  end

  describe "Post #survey" do
    it "saves answer successfully" do
      post :create, params: request_body
      expect(response).to be_successful
      p response.body
    end
  end

  private

    def request_body
      {
        id: survey.id,
        answers: [
          {
            question_id: question.id,
            type: "option",
            option_id: option_one.id
          }
        ]
      }
    end
end
