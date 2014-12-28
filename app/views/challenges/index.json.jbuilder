json.array!(@challenges) do |challenge|
  json.extract! challenge, :id, :name, :description, :starts_on, :ends_on
  json.url challenge_url(challenge, format: :json)
end
