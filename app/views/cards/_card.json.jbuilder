json.extract! card, :id, :title, :percent, :user_id, :created_at, :updated_at
json.url card_url(card, format: :json)