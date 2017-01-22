class Client < ApplicationRecord
  belongs_to :user
  has_one :client_profile
end
