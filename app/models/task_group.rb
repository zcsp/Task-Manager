class TaskGroup < ApplicationRecord
  belongs_to :project
  has_many :tasks

  before_destroy :destroy_associated_records

   private

   def destroy_associated_records
    self.tasks.destroy_all
   end

end
