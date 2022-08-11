class CreateQuestion < ActiveRecord::Migration[7.0]
  def change
    create_table :questions, id: :uuid do |t|
      t.string :title
      t.integer :question_type
      t.references :survey, null: false, foreign_key: true, index: true, type: :uuid

      t.timestamps
    end
  end
end
