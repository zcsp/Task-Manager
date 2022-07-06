class AddOrderToTaskGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :task_groups, :order, :integer
  end
end
