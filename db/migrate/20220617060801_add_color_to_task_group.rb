class AddColorToTaskGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :task_groups, :color, :string
  end
end
