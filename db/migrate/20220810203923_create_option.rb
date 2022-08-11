class CreateOption < ActiveRecord::Migration[7.0]
  def change
    create_table :options, id: :uuid do |t|
      t.string :title
      t.references :question, null: false, foreign_key: true, index: true, type: :uuid

      t.timestamps
    end
  end
end
