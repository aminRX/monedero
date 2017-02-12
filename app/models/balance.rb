class Balance < ApplicationRecord
  belongs_to :client
  belongs_to :vendor, optional: true
  has_one :balance_information

  accepts_nested_attributes_for :balance_information

  def self.sufficient_balance?(points)
    points <= self.sum(:point) ? true : false
  end

  def calculate_points(amount, percent_catalog)
    self.point = (percent_catalog.percent.to_f / 100.to_f) * amount.to_f
  end
end
