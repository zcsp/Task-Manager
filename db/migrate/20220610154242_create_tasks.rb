class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.belongs_to :task_group, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
