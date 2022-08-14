# frozen_string_literal: true

# == Schema Information
#
# Table name: feedbacks
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  survey_id  :uuid             not null
#
# Indexes
#
#  index_feedbacks_on_survey_id  (survey_id)
#
# Foreign Keys
#
#  fk_rails_...  (survey_id => surveys.id)
#
require "rails_helper"

RSpec.describe Feedback, type: :model do
  let(:feedback) { create(:feedback) }

  describe "relations" do
    it { is_expected.to have_many(:responses) }
    it { is_expected.to belong_to(:survey) }
  end
end
