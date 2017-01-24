class ClientProfile < ApplicationRecord
  belongs_to :clients, optional: true
end
