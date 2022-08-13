# frozen_string_literal: true

require "rails_helper"

RSpec.describe Feedback, type: :model do
  let(:feedback) { create(:feedback) }

  describe "relations" do
    it { is_expected.to have_many(:responses) }
    it { is_expected.to belong_to(:survey) }
  end
end
