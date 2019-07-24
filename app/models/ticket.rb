class Ticket < ApplicationRecord
  validates :price, presence: true
  validates :price, inclusion: { in: (0..1000), message: "Price should be between 0 and 1000" }

  belongs_to :event
  has_one :purchase, dependent: :destroy
  has_one :user, through: :purchase
end
