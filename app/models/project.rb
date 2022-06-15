class Project < ApplicationRecord
  has_many :task_groups
  has_many :tasks, through: :task_groups
end
