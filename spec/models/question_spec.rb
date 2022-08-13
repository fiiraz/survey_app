# frozen_string_literal: true

require "rails_helper"

RSpec.describe Question, type: :model do
  let(:question) { create(:question) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_most(280) }
    it { is_expected.to validate_presence_of(:question_type) }
  end

  describe "relations" do
    it { is_expected.to have_many(:options) }
    it { is_expected.to have_many(:responses) }
    it { is_expected.to belong_to(:survey) }
  end
end
