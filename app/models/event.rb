class Event < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :name, length: { in: 10..40 }
end
