require "open-uri"

puts "Destroying previous data"
ParkFacility.destroy_all
Park.destroy_all
Facility.destroy_all
User.destroy_all

FACILITIES = ["toilets", "tennis court", "wheelchair accessible", "baby changing", "picnic area", "drink stand", "cafe", "soccer field", "baseball field", "open air stage", "playground"]
ATTRACTIONS = ["large lawn", "boat riding", "historical site", "nature reserve", "bird watching", "cherry blossoms"]
park_names = ["Tamagawadai", "Todoroki Ravine", "Yoyogi Park", "Ueno Park", "Komazawa Park", "Kinuta Park", ]
BEST_SEASON = ["summer", "autumn", "spring", "winter"]

puts "Creating users"
noemi = User.create!(
  username: "Noemi",
  email: "noemi@email.com",
  password: "123456",
  role: "admin"
)

jillian = User.create!(
  username: "Jillian",
  email: "jillian@email.com",
  password: "123456",
  role: "user"
)

puts "Creating facilities"
facilities = FACILITIES.map do |facility|
  Facility.create!(name: facility)
end

attractions = ATTRACTIONS.map do |attraction|
  Facility.create!(name: attraction, is_attraction: true)
end

puts "creating parks"
park_names.each do |park|
  current_park = Park.create!(
    name: park,
    address: Faker::Address.full_address,
    opening_hours: "#{rand(0..24)} - #{rand(0..24)}",
    description: Faker::Lorem.paragraph(sentence_count: 5),
    best_season: BEST_SEASON.sample,
    admin: noemi
  )

  park_facilities = facilities.sample(rand(2..4))
  park_attractions = attractions.sample(rand(2..4))
  
  park_facilities.each do |park_fac|
    ParkFacility.create!(
      park: current_park,
      facility: park_fac
    )
  end

  park_attractions.each do |park_attr|
    ParkFacility.create!(
      park: current_park,
      facility: park_attr
    )
  end

  photo_file = URI.open("#{Faker::LoremFlickr.image(search_terms: ['park'])}")
  current_park.photo.attach(io: photo_file, filename: "park.jpg", content_type: "image/jpg")
end

puts "Done!"
