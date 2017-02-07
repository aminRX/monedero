class Balance < ApplicationRecord
  belongs_to :client
  belongs_to :vendor

  def self.sufficient_balance?(points)
    points <= self.sum(:point) ? true : false
  end
end
