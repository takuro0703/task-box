class Task < ApplicationRecord
  validates :todo, presence: true
  belongs_to :user
  belongs_to :group
end
