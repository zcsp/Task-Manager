class AddOrderToTaskGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :task_groups, :order, :integer

    Project.find_each do |p|
      p.task_groups.each do |tg, i|
        tg.update_attribute(:order, i)
      end
    end
  end
end
