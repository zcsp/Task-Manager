class Project < ApplicationRecord
  has_many :task_groups
  has_many :tasks, through: :task_groups

  before_destroy :destroy_associated_records

   private

   def destroy_associated_records
    self.task_groups.each { |tg| tg.tasks.destroy_all }
    self.task_groups.destroy_all
   end
end
