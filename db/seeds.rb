# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

require "open-uri"


#GET the explication by planet
# api_content_planet = astro_api.call("general_sign_report/tropical/planet_name", date, month, year, hour, minute, latitude, longitude, -5)
# content_parsed = JSON.parse(api_content_planet)
# p content_planet = content_parsed["report"]
#GET the chart image
#astro_api.call("custom_western_chart", date, month, year, hour, minute, latitude, longitude, timezone)

#GET the horoscope
#p astro_api.call("personalized_planet_prediction/daily/sun", date, month, year, hour, minute, latitude, longitude, timezone)

#Get the compatibility report with compatibility %
#maleBirthData = {'date' => 20, "month" => 02, "year" => 1990, "hour" => 5, "minute" => 30, "latitude" => 48.8667, "longitude" => 2.2333, "timezone" => 1.0}
#femaleBirthData = {'date' => 14, "month" => 03, "year" => 1989, "hour" => 7, "minute" => 10, "latitude" => 50.724, "longitude" => 3.162, "timezone" => 1.0}
#astro_api.matchMakingCall("love_compatibility_report/tropical", maleBirthData, femaleBirthData)

#Get the compatibility report by sun/rising sign






# //SEED//
ChartElement.destroy_all
UserMatch.destroy_all
Match.destroy_all
Like.destroy_all
User.destroy_all

puts "Creating User..."

file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1539599254/janttrofl6xagki5zk6g.jpg')
cecile = User.create!(email: "cecile@cosmeet.com", password: "123456", name: "Cecile", birth_date: "1988-12-29", birth_time: "5:40", birth_place:"Compiègne", gender: "Woman", sexual_preference: "Man", relationship_type:"Serious", element_ranking: [1,2,3,4], mode_ranking: [1,3,2], personality_trait: "#sensible  #dreamer  #creative", latitude: 49.41, longitude: 2.82, biography: "Teacher at Le Wagon, passionate about astrology, looking for the right fit!")
cecile.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1591797591/n5scqiyz95fg7l1kwfha.jpg')
louis = User.create!(email: "louis@cosmeet.com", password: "123456", name: "Louis", birth_date: "1990-02-20", birth_time: "5:30", birth_place:"Suresnes", gender: "Man", sexual_preference: "Woman", relationship_type:"Sexual", element_ranking: [3,4,1,2], mode_ranking: [1,2,3], personality_trait: "#adventurous  #curious  #creative", latitude: 48.86, longitude: 2.23, biography: "I slash life with passion. Musician, photographer and teacher at Le Wagon.")
louis.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


file = URI.open('https://avatars3.githubusercontent.com/u/61389907?v=4')
quentin = User.create!(email: "quentin@cosmeet.com", password: "123456", name: "Quentin", birth_date: "1990-09-22", birth_time: "16:30", birth_place:"Rueil-Malmaison", gender: "Man", sexual_preference: "Both", relationship_type:"Casual", element_ranking: [3,1,4,2], mode_ranking: [3,1,2], personality_trait: "adventurous, go-getter, curious", latitude: 48.88, longitude: 2.20, biography: "US football fan, I coach teams for a living. I also love to spend time with Mango my cat.")
quentin.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


file = URI.open('https://avatars2.githubusercontent.com/u/1598346?v=4')
guillaume = User.create!(email: "guillaume@cosmeet.com", password: "123456", name: "Guillaume", birth_date: "1981-03-30", birth_time: "2:26", birth_place:"Rennes", gender: "Man", sexual_preference: "Woman", relationship_type:"Serious", element_ranking: [3,1,4,2], mode_ranking: [3,1,2], personality_trait: "#funny #go-getter #creative", latitude: 48.08, longitude: -1.68, biography: "Recently been promoted to teacher at Le Wagon, I enjoy a good fried chicken (not without shame).")
guillaume.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1544604383/pnqv3gmdpbtqrstpqgls.jpg')
romain = User.create!(email: "romain@cosmeet.com", password:"123456", name: "Romain", birth_date: "1987-03-16", birth_time: "12:00", birth_place:"Boulogne-Billancourt", gender: "Man", sexual_preference: "Woman", relationship_type:"Serious", element_ranking: [1,2,3,4], mode_ranking: [1,3,2], personality_trait: "#sensible  #dreamer  #creative", latitude: 48.83, longitude: 2.25, biography: "Used to skate now I teach. Looking for a sweet woman to spoil.")
romain.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Elsa
file = URI.open('https://avatars2.githubusercontent.com/u/61321542?v=4')
elsa = User.create!(email: "elsa@cosmeet.com", password:"123456", name: "Elsa", birth_date: "1990-04-02", birth_time: "15:44", birth_place:"Schoelcher", gender: "Woman", sexual_preference: "Man", relationship_type:"Serious", element_ranking: [1,3,2,4], mode_ranking: [1,3,2], personality_trait: "#adventurous #traveller #dynamic", latitude: 14.61, longitude: -61.05, biography: "Born and raised in Martinique. I love to travel and hate skooters.")
elsa.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Oceane
file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1597859853/hlm3ivjlz0tezolmvyvo.jpg')
oceane = User.create!(email: "oceane@cosmeet.com", password:"123456", name: "Océane", birth_date: "1989-03-14", birth_time: "7:10", birth_place: "Tourcoing", gender: "Woman", sexual_preference: "Man", relationship_type:"Serious", element_ranking: [2,3,4,1], mode_ranking: [2,3,1], personality_trait: "#committed #romantic #creative", latitude: 50.72, longitude: 3.16, biography: "Wabi-sabi and daydreaming believer. I love animails and hate the garbage trucks sound.")
oceane.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# User Edouard
file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1535710792/jwfoxmnm29vxuny3vmxi.jpg')
edouard = User.create!(email: "edouard@cosmeet.com", password:"123456", name: "Edouard", birth_date: "1989-11-20", birth_time: "18:30", birth_place: "Le Mans", gender: "Man", sexual_preference: "Woman", relationship_type: "Serious", element_ranking: [3,2,4,1], mode_ranking: [3,2,1], personality_trait: "#romantic #sociable #entrepreneur", latitude: 48.00, longitude: 0.19, biography: "Cop of the wagon, my mission is to make the students follow the rules but always with a smile on my face.")
edouard.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# User Dimitri
file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1523284008/vewklncjschzufwaixd6.jpg')
dimitri = User.create!(email: "dimitri@cosmeet.com", password:"123456", name: "Dimitri", birth_date: "1986-03-04", birth_time: "14:40", birth_place: "Lyon", gender: "Man", sexual_preference: "Woman", relationship_type: "Sexual", element_ranking: [4,2,1,3], mode_ranking: [1,3,2], personality_trait: "#caring #creative #sensitive", latitude: 45.75, longitude: 4.85, biography: "Master of the reeboot, I ride my silver bike around town jazzy style.")
dimitri.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
#User Joseph
file = URI.open('https://avatars0.githubusercontent.com/u/63474556?v=4')
joseph = User.create!(email: "joseph@cosmeet.com", password:"123456", name: "Joseph", birth_date: "1996-11-11", birth_time: "17:01", birth_place: "Paris", gender: "Man", sexual_preference: "Woman", relationship_type: "Serious", element_ranking: [1,2,3,4], mode_ranking: [1,2,3], personality_trait: "#intense  #passionate #sarcastic", latitude: 48.85, longitude: 2.34, biography: "Graduated from Berkeley, I have a passion for Shrek and nice prints on my shorts." )
joseph.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
#User Mathilde
file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1596092435/l5ra1wph8je4jrzhgodr.jpg')
mathilde = User.create!(email: "mathilde@cosmeet.com", password:"123456", name: "Mathilde", birth_date: "1988-01-21",birth_time: "2:35", birth_place: "Créteil", gender: "Woman", sexual_preference: "Man", relationship_type: "Serious", element_ranking: [2,1,4,3], mode_ranking: [2,3,1], personality_trait: "#social #suave #indecisive", latitude: 48.78, longitude: 2.46, biography: "I am warrior passionated by crime sections. I also never say no to a nice drink!")
mathilde.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
#User Chloé
# file = URI.open('https://avatars2.githubusercontent.com/u/65725594?v=4')
# chloe = User.create!(email: "chloe@cosmeet.com", password:"123456", name: "Chloé", birth_date: "1988-05-08", birth_place: "Lagny-sur-Marne", gender: "Woman", sexual_preference: "Man", relationship_type: "Serious", element_ranking: [1,4,3,2], mode_ranking: [3,1,2], personality_trait: "#generous #proud #lustful", latitude: 48.86, longitude: 2.71, biography: "Manager of a music band, I ride Paris with great hair!")
# chloe.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

puts "Creating Likes..."

Like.create(user: quentin, receiver: elsa, liked: true)

puts "Creating Chart Element..."
  User.find_each do |user|
    PopulateChartElementJob.perform_now(user)
  end
