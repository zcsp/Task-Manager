class CreateUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :updates do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
