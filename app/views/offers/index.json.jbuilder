json.array!(@offers) do |offer|
  json.extract! offer, :id, :offer_id, :offerdate, :last_update, :position, :location, :content, :url, :company, :ico
  json.url offer_url(offer, format: :json)
end
