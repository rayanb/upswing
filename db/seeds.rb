comp = Industry.create(name: "Computer Software")
bus  = Industry.create(name: "Business Development")
econ = Industry.create(name: "Economist")
professions_array = [comp, bus, econ]
require 'date'

40.times do |x|
  random_number = rand(0..2)
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email, provider: Faker::Internet.url, uid: Faker::Code.isbn, oauth_token: Faker::Code.isbn, location_city: Faker::Address.city, location_state: Faker::Address.state, location_longitude: Faker::Address.longitude, location_latitude: Faker::Address.latitude, picture_url: Faker::Avatar.image, industry: professions_array[random_number], job: Faker::Name.title, specialty: Faker::Lorem.paragraph,  golfcourse: Faker::Company.name, handicap: random_number, oauth_expires_at: Date.new)
  2.times do
    Job.create(company_name: Faker::Company.name, title: Faker::Name.title, user_id: x)
  end
end
