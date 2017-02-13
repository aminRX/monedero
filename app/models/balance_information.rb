class BalanceInformation < ApplicationRecord
  belongs_to :percent_catalog, optional: true
  belongs_to :balance, optional: true
  after_validation :calculate_points, on: [:update]

  protected
  def calculate_points
    result = (self.percent_catalog.percent.to_f / 100.to_f) * self.amount.to_f
    balance = self.balance
    balance.update_attribute(:point, result)
  end
end
