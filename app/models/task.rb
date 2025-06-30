class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: { case_insensitive: false }
  validates :description, presence: true
end
