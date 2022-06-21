class Update < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :task
end
