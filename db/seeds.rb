comp = Industry.create(name: "Computer Software")
Industry.create(name: "Science")
Industry.create(name: "Science-fiction")
Industry.create(name: "Heyya")

require 'date'

20.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, provider: Faker::Internet.url, uid: Faker::Code.isbn, oauth_token: Faker::Code.isbn, location_city: Faker::Address.city, location_state: Faker::Address.state, location_longitude: Faker::Address.longitude, location_latitude: Faker::Address.latitude, picture_url: Faker::Avatar.image, industry: comp, job: Faker::Name.title, golfcourse: Faker::Company.name, handicap: rand(1..20), description: Faker::Lorem.paragraph, oauth_expires_at: Date.new)
end
