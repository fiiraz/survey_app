# frozen_string_literal: true

require "rails_helper"

RSpec.describe Option, type: :model do
  let(:option) { create(:option) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_most(40) }
  end

  describe "relations" do
    it { is_expected.to have_many(:responses) }
    it { is_expected.to belong_to(:question) }
  end
end
