require "rails_helper"

RSpec.describe SurveySerializer, type: :serializer do
  describe "serialize" do
    context "survey serializer" do
      it "serializes model" do
        survey = create(:survey)
        result = described_class.new(survey)
        p result
        expect(result.serializable_hash[:name]).to eq "test survey"
      end
    end
  end
end
