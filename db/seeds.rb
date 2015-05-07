comp = Industry.create(name: "Computer Software")
Industry.create(name: "Science")
Industry.create(name: "Science-fiction")
Industry.create(name: "Heyya")

require 'date'

40.times do |x|
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email, provider: Faker::Internet.url, uid: Faker::Code.isbn, oauth_token: Faker::Code.isbn, location_city: Faker::Address.city, location_state: Faker::Address.state, location_longitude: Faker::Address.longitude, location_latitude: Faker::Address.latitude, picture_url: Faker::Avatar.image, industry: comp, job: Faker::Name.title, golfcourse: Faker::Company.name, handicap: rand(1..20), description: Faker::Lorem.paragraph, oauth_expires_at: Date.new)
  2.times do
    Job.create(company_name: Faker::Company.name, title: Faker::Name.title, user_id: x)
    Education.create(school_name: "#{Faker::Name.name} school" , field_of_study: Faker::Commerce.department, user_id: x)
  end
end
