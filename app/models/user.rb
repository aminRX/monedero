class User < ApplicationRecord
  has_secure_token :auth_token
  has_secure_password
  has_many :clients
  has_many :vendors
  belongs_to :branch_office
end
