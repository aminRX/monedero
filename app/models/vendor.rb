class Vendor < ApplicationRecord
  belongs_to :user
  has_many :balances
  validates :name, presence: true
  validates :email,
            presence: true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
