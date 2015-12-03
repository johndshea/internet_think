json.array!(@inquirers) do |inquirer|
  json.extract! inquirer, :id, :username, :email, :password, :password_confirmation
  json.url inquirer_url(inquirer, format: :json)
end
