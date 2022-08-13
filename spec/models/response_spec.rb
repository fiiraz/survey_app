# frozen_string_literal: true

require "rails_helper"

RSpec.describe Response, type: :model do
  let(:response) { create(:response) }

  describe "validations" do
    it { is_expected.to validate_length_of(:body).is_at_most(280) }
  end

  describe "relations" do
    it { is_expected.to belong_to(:question) }
    it { is_expected.to belong_to(:feedback) }
    it { is_expected.to belong_to(:option).optional }
  end
end
