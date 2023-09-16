class Salary < ApplicationRecord
  belongs_to :user

  validates :salary, presence: true
end
