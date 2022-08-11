class CreateFeedback < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks, id: :uuid do |t|
      t.references :survey, null: false, foreign_key: true, index: true, type: :uuid

      t.timestamps
    end
  end
end
