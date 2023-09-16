class Salary < ApplicationRecord
  belongs_to :user

  validates :salary, :benefits, presence: true
end
