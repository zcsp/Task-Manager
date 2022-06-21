class Task < ApplicationRecord
  belongs_to :task_group, optional: true
  belongs_to :user, optional: true
  has_one :status, required: false
  has_many :updates
end
