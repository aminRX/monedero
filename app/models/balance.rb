class Balance < ApplicationRecord
  belongs_to :client

  def self.sufficient_balance?(points)
    points <= self.sum(:point) ? true : false
  end
end
