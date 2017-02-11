class BalanceInformation < ApplicationRecord
  belongs_to :percent_catalog, optional: true
  belongs_to :balance, optional: true
end
