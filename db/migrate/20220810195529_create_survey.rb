class CreateSurvey < ActiveRecord::Migration[7.0]
  def change
    create_table :surveys, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
    add_index :surveys, :name, unique: true
  end
end
