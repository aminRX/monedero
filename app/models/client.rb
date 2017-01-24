class Client < ApplicationRecord
  belongs_to :user
  has_one :client_profile
  accepts_nested_attributes_for :client_profile
end
