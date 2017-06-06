class User < ApplicationRecord
  before_create :as_branch_office
  has_secure_token :auth_token
  has_secure_password
  has_many :clients
  has_many :vendors
  has_many :cards
  has_one :branch_office
  belongs_to :role, optional: true

  has_one :profile
  accepts_nested_attributes_for :profile

  private

  def as_branch_office
    self.role ||= Role.find_by_name('branch_office')
  end
end
