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
Message.destroy_all
Compatibility.destroy_all
ChartElement.destroy_all
UserMatch.destroy_all
Match.destroy_all
Like.destroy_all
User.destroy_all

puts "Creating User..."

#User Cécile
file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1539599254/janttrofl6xagki5zk6g.jpg')
cecile = User.create!(email: "cecile@cosmeet.com", password: "123456", name: "Cecile", birth_date: "1988-12-29", birth_time: "5:40", birth_place:"Compiègne", gender: "Woman", sexual_preference: "Man", relationship_type:"Serious", element_ranking: ["water","fire","earth","air"], mode_ranking: ["cardinal","fixed","mutable"], personality_traits: ["sensible", "dreamer", "creative"], latitude: 49.41, longitude: 2.82, biography: "Teacher at Le Wagon, passionate about astrology, looking for the right fit!", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])
cecile.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Louis
file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1591797591/n5scqiyz95fg7l1kwfha.jpg')
louis = User.create!(email: "louis@cosmeet.com", password: "123456", name: "Louis", birth_date: "1990-02-20", birth_time: "5:30", birth_place:"Suresnes", gender: "Man", sexual_preference: "Woman", relationship_type:"Sexual", element_ranking: ["water","fire","earth","air"], mode_ranking: ["cardinal","fixed","mutable"], personality_traits: ["adventurous", "curious", "creative"], latitude: 48.86, longitude: 2.23, biography: "I slash life with passion. Musician, photographer and teacher at Le Wagon.", age_preference: [25, 40], activities: ["reading", "the Great Outdoors", "meditation"] )
louis.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Quentin
file = URI.open('https://avatars0.githubusercontent.com/u/61389907?s=460&u=a202ba8aa81578809c4a49974fb52a6e13d1c084&v=4')
quentin = User.create!(email: "quentin@cosmeet.com", password: "123456", admin: true, name: "Quentin", birth_date: "1990-09-22", birth_time: "16:30", birth_place:"Rueil-Malmaison", gender: "Man", sexual_preference: "Both", relationship_type:"Casual", element_ranking: ["water","fire","earth","air"], mode_ranking: ["cardinal","fixed","mutable"], personality_traits: ["adventurous", "go-getter", "curious"], latitude: 48.88, longitude: 2.20, biography: "US football fan, I coach teams for a living. I also love to spend time with Mango my cat.", age_preference: [18, 25], activities: ["geeking", "socializing", "football"])

quentin.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Guillaume
file = URI.open('https://avatars2.githubusercontent.com/u/1598346?v=4')

guillaume = User.create!(email: "guillaume@cosmeet.com", password: "123456", name: "Guillaume", birth_date: "1981-03-30", birth_time: "2:26", birth_place:"Rennes", gender: "Man", sexual_preference: "Woman", relationship_type:"Serious", element_ranking: ["earth","air","water","fire"], mode_ranking: ["cardinal","fixed","mutable"], personality_traits: ["funny", "go-getter", "creative"], latitude: 48.08, longitude: -1.68, biography: "Recently been promoted to teacher at Le Wagon, I enjoy a good fried chicken (not without shame).", age_preference: [30, 40], activities: ["partying", "socializing", "meditation"])

guillaume.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Romain
file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1544604383/pnqv3gmdpbtqrstpqgls.jpg')

romain = User.create!(email: "romain@cosmeet.com", password:"123456", name: "Romain", birth_date: "1987-03-16", birth_time: "12:00", birth_place:"Boulogne-Billancourt", gender: "Man", sexual_preference: "Woman", relationship_type:"Serious", element_ranking: ["earth","air","water","fire"], mode_ranking: ["fixed","mutable","cardinal"], personality_traits: ["sensible", "dreamer", "creative"], latitude: 48.83, longitude: 2.25, biography: "Used to skate now I teach. Looking for a sweet woman to spoil.", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

romain.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Elsa
file = URI.open('https://avatars2.githubusercontent.com/u/61321542?s=460&u=44c3d6f9b65132a9b3e5185dedcf164bbfaf5c75&v=4')

elsa = User.create!(email: "elsa@cosmeet.com", password:"123456", name: "Elsa", admin: true, birth_date: "1990-04-02", birth_time: "21:44", birth_place:"Schoelcher", gender: "Woman", sexual_preference: "Man", relationship_type:"Serious", element_ranking: ["earth","air","water","fire"], mode_ranking: ["fixed","mutable","cardinal"], personality_traits: ["adventurous", "traveller", "dynamic"], latitude: 14.61, longitude: -61.05, biography: "Born and raised in Martinique. I love to travel and hate skooters.", age_preference: [18, 35], activities: ["partying", "socializing", "meditation"])

elsa.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Oceane
file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1597859853/hlm3ivjlz0tezolmvyvo.jpg')

oceane = User.create!(email: "oceane@cosmeet.com", password:"123456", name: "Océane", admin: true, birth_date: "1989-03-14", birth_time: "7:10", birth_place: "Tourcoing", gender: "Woman", sexual_preference: "Man", relationship_type:"Serious", element_ranking: ["earth","air","water","fire"], mode_ranking: ["fixed","mutable","cardinal"], personality_traits: ["committed", "romantic", "creative"], latitude: 50.72, longitude: 3.16, biography: "Wabi-sabi and daydreaming believer. I love animals and hate the garbage trucks sound.", age_preference: [30, 45], activities: ["partying", "socializing", "meditation"])

oceane.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# User Edouard
file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1535710792/jwfoxmnm29vxuny3vmxi.jpg')

edouard = User.create!(email: "edouard@cosmeet.com", password:"123456", name: "Edouard", birth_date: "1989-11-20", birth_time: "18:30", birth_place: "Le Mans", gender: "Man", sexual_preference: "Woman", relationship_type: "Serious", element_ranking: ["earth","air","water","fire"], mode_ranking: ["fixed","mutable","cardinal"], personality_traits: ["romantic", "sociable", "entrepreneur"], latitude: 48.00, longitude: 0.19, biography: "Cop of the wagon, my mission is to make the students follow the rules but always with a smile on my face.", age_preference: [20, 35], activities: ["partying", "socializing", "meditation"])

edouard.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# User Dimitri
# file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1535710792/jwfoxmnm29vxuny3vmxi.jpg')

file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1523284008/vewklncjschzufwaixd6.jpg')

dimitri = User.create!(email: "dimitri@cosmeet.com", password:"123456", name: "Dimitri", birth_date: "1986-03-04", birth_time: "14:40", birth_place: "Lyon", gender: "Man", sexual_preference: "Woman", relationship_type: "Sexual", element_ranking: ["earth","air","water","fire"], mode_ranking: ["mutable","cardinal","fixed"], personality_traits: ["caring", "creative", "sensitive"], latitude: 45.75, longitude: 4.85, biography: "Master of the reboot, I ride my silver bike around town jazzy style.", age_preference: [30, 40], activities: ["coding", "playing music", "yoga"])

dimitri.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Joseph
file = URI.open('https://avatars0.githubusercontent.com/u/63474556?v=4')

joseph = User.create!(email: "joseph@cosmeet.com", password:"123456", name: "Joseph", birth_date: "1996-11-11", birth_time: "17:01" , birth_place: "Paris", gender: "Man", sexual_preference: "Woman", relationship_type: "Serious", element_ranking: ["air","water","earth","fire"], mode_ranking: ["mutable","cardinal","fixed"], personality_traits: ["intense", "passionate", "sarcastic"], latitude: 48.85, longitude: 2.34, biography: "Graduated from Berkeley, I have a passion for Shrek and nice prints on my shorts.", age_preference: [18, 25], activities: ["partying", "socializing", "meditation"] )

joseph.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Mathilde
file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1596092435/l5ra1wph8je4jrzhgodr.jpg')

mathilde = User.create!(email: "mathilde@cosmeet.com", password:"123456", name: "Mathilde", birth_date: "1988-01-21", birth_time: "02:35" , birth_place: "Créteil", gender: "Woman", sexual_preference: "Man", relationship_type: "Serious", element_ranking: ["air","water","earth","fire"], mode_ranking: ["mutable","cardinal","fixed"], personality_traits: ["social", "suave", "indecisive"], latitude: 48.78, longitude: 2.46, biography: "I am warrior passionated by crime sections. I also never say no to a nice drink!", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

mathilde.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Anthony
file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1597872878/ykktauyyzddh4mkkrzd2.jpg')

anthony = User.create!(email: "anthony@cosmeet.com", password: "123456", name: "Anthony", birth_date: "1995-01-31", birth_time: "9:30", birth_place: "Limoges", gender: "Man", sexual_preference: "Both", relationship_type: "Casual", element_ranking: ["air","water","earth","fire"], mode_ranking: ["mutable","cardinal","fixed"], personality_traits: ["scientist", "independent", "progressive"], latitude: 45.85, longitude: 1.25, biography: "I love to travel around the world even with people I don't know.", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

anthony.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


#User Alex Huyn
file = URI.open('https://avatars1.githubusercontent.com/u/59102138?v=4')

alex_h = User.create!(email: "alexh@cosmeet.com", password: "123456", name: "Alex", birth_date: "1984-05-18", birth_time: "4:35", birth_place: "Saint-Denis", gender: "Man", sexual_preference: "Man", relationship_type: "Serious", element_ranking: ["water","air","earth","fire"], mode_ranking: ["fixed","mutable","cardinal"], personality_traits: ["calm", "trustworthy", "responsible"], latitude: 48.93, longitude: 2.36, biography: "Very environmentaly conscious, I can count your carbon print in no time. Green is good is my moto!", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

alex_h.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Julie
file = URI.open('https://avatars0.githubusercontent.com/u/64073068?v=4')

julie = User.create!(email: "julie@cosmeet.com", password: "123456", name: "Julie", birth_date: "1988-01-20", birth_time: "19:00", birth_place: "Paris", gender: "Woman", sexual_preference: "Man", relationship_type: "Serious", element_ranking: ["water","air","earth","fire"], mode_ranking: ["fixed","mutable","cardinal"], personality_traits: ["practical", "hardworking", "ambitious"], latitude: 48.83, longitude: 2.32, biography: "My world used to be excel sheets, now my focus will be programming & love...", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

julie.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Lamia
file = URI.open('https://ca.slack-edge.com/T02NE0241-UTSDT4WA2-2ac77c426602-512')

lamiaa = User.create!(email: "lamiaa@cosmeet.com", password: "123456", name: "Lamiaa", birth_date: "1990-09-21", birth_time: "3:10", birth_place: "Toulouse", gender: "Woman", sexual_preference: "Man", relationship_type: "Serious", element_ranking: ["water","air","earth","fire"], mode_ranking: ["fixed","mutable","cardinal"], personality_traits: ["kind", "precise", "loyal"], latitude: 43.60, longitude: 1.44, biography: "Sweet as a candy, free as a horse, I like to bring people together.", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

lamiaa.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Patricia
file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1598344755/h4fffdritigsa9w2rkti.jpg')

patricia = User.create!(email: "patricia@cosmeet.com", password: "123456", name: "Patricia", birth_date: "1999-08-27", birth_time: "3:40", birth_place: "Paris", gender: "Woman", sexual_preference: "Woman", relationship_type: "Sexual", element_ranking: ["water","air","earth","fire"], mode_ranking: ["fixed","mutable","cardinal"], personality_traits: ["cheerful", "expressive", "inventive"], latitude: 48.83, longitude: 2.32, biography: "Girl just wanna fun!", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

patricia.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Martin
file = URI.open('https://avatars1.githubusercontent.com/u/62666031?v=4')

martin = User.create!(email: "martin@cosmeet.com", password: "123456", name: "Martin", birth_date: "1992-07-26", birth_time: "10:40", birth_place: "Orléans", gender: "Man", sexual_preference: "Woman", relationship_type: "Curious", element_ranking: ["air","water","earth","fire"], mode_ranking: ["fixed","mutable","cardinal"], personality_traits: ["childish", "proud", "sincere"], latitude: 47.91, longitude: 1.9, biography: "I pretend I did Harvard to pick-up girls, would it work on you?", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

martin.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#Christophe
file = URI.open('https://avatars0.githubusercontent.com/u/62895586?v=4')

christophe = User.create!(email: "christophe@cosmee.com", password: "123456", name: "Christophe", birth_date: "1978-08-25", birth_time: "17:05", birth_place: "Clamart", gender: "Man", sexual_preference: "Woman", relationship_type: "Serious", element_ranking: ["earth","air","water","fire"], mode_ranking: ["cardinal","fixed","mutable"], personality_traits: ["hardworking", "kind", "calm"], latitude:48.80, longitude: 2.26, biography: "I used to design auto motors, now I design apps. My friend call me 'soft power'", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

christophe.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')


#User Corentin Malvaux
file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1594053645/uvcfxlqizphyumwnqzck.jpg')

corentin_malvaux = User.create!(email: "corentin_malvaux@cosmeet.com", password: "123456", name: "Corentin M", birth_date: "1991-08-29", birth_time: "21:42", birth_place: "Fontainebleau", gender: "Man", sexual_preference: "Both", relationship_type: "Serious", element_ranking: ["earth","air","water","fire"], mode_ranking: ["fixed","mutable","cardinal"], personality_traits: ["loyal", "calm", "helpful"], latitude: 48.4, longitude: 2.7, biography: "A nice guy to hang out with. Netflix and chill and so much more.", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

corentin_malvaux.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Julien DaSilva
file = URI.open('https://avatars1.githubusercontent.com/u/11377783?s=400&u=218f16fd0267353034559231afbd58622982a4bf&v=4')

julien_d = User.create!(email: "julien@cosmeet.com", password: "123456", name: "Julien", birth_date: "1986-03-12", birth_time: "15:23", birth_place: "Paris", gender: "Man", sexual_preference: "Woman", relationship_type: "Serious", element_ranking: ["earth","air","water","fire"], mode_ranking: ["cardinal","fixed","mutable"], personality_traits: ["compassionate", "wise", "sensitive"], latitude: 48.83, longitude: 2.32, biography: "When I am not here, it's because I baby-sit.", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

julien_d.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Raphael Bilon
#file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1594388173/fwgzimmjivqzsi9dk1wu.jpg')

#raphael_bilon = User.create!(email: "raphael_bilon@cosmeet.com", password: "123456", name: "Raphael B", birth_date: "1992-09-15", birth_time: "00:30", birth_place: "Paris", gender: "Man", sexual_preference: "Woman", relationship_type: "Casual", element_ranking: ["earth","air","water","fire"], mode_ranking: ["cardinal","fixed","mutable"], personality_traits: ["ambitious", "optimistic", "confident"], latitude: 48.85, longitude: 2.34, biography: "Mankind is the only animal that can remain on friendly terms with the victims he intends to eat until he eats them.")

#raphael_bilon.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Adrien Fort
file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1594044342/wxmddv0pmdhneh3kojbp.jpg')

adrien = User.create!(email: "adrien@cosmeet.com", password: "123456", name: "Adrien", birth_date: "2001-12-19", birth_time: "9:12", birth_place: "Laval", gender: "Man", sexual_preference: "Woman", relationship_type: "Serious", element_ranking: ["water","air","earth","fire"], mode_ranking: ["mutable","cardinal","fixed"], personality_traits: ["generous", "freedom-loving", "great sense of humor"], latitude: 48.07, longitude: -0.76, biography: "I planned on accumulate as much money as possible when I am 30 in order to travel the rest of my life.", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

adrien.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Julien Bouland
file = URI.open('https://avatars3.githubusercontent.com/u/47059149?v=4')

julien = User.create!(email: "julienb@cosmeet.com", password: "123456", name: "Julien", birth_date: "1995-02-17", birth_time: "14:02", birth_place: "Paris", gender: "Man", sexual_preference: "Both", relationship_type: "Sexual", element_ranking: ["earth","air","water","fire"], mode_ranking: ["cardinal","fixed","mutable"], personality_traits: ["independent", "progressive", "humanitarian"], latitude: 48.85, longitude: 2.34, biography: "I traveled around the world but I still have not find my soulmate yet.", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

julien.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Eliott Mogenet
file = URI.open('https://res.cloudinary.com/wagon/image/upload/v1597912687/tmy20aexx0mnpwled9nt.jpg')

eliott = User.create!(email: "eliott@cosmeet.com", password: "123456", name: "Eliott", birth_date: "1997-04-22", birth_time: "9:32", birth_place: "Lyon", gender: "Man", sexual_preference: "Woman", relationship_type: "Serious", element_ranking:["water","air","earth","fire"], mode_ranking: ["fixed","mutable","cardinal"], personality_traits: ["sensitive", "affectionate", "aloof"], latitude: 45.75, longitude: 4.85, biography: "I enjoy long talks, nice built tech products and drinks with a nice view.", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

eliott.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Vincent Pacheco
file = URI.open('https://avatars0.githubusercontent.com/u/67064699?v=4')

vincent = User.create!(email: "vincent@cosmeet.com", password: "123456", name: "Vincent", birth_date: "1995-11-16", birth_time: "14:55", birth_place: "Lagny-sur-Marne", gender: "Man", sexual_preference: "Woman", relationship_type: "Casual", element_ranking: ["fire", "earth", "water", "air"], mode_ranking: ["cardinal","fixed","mutable"], personality_traits: ["intense", "magnetic", "sarcastic"], latitude: 48.87, longitude: 2.71, biography: "Passionate about iT, I am a very sporty guy with a soft heart.", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

vincent.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Grégoire Pothier
file = URI.open('https://avatars3.githubusercontent.com/u/64417080?v=4')

gregoire = User.create!(email: "gregoire@cosmeet.com", password: "123456", name: "Grégoire", birth_date: "1987-11-28", birth_time: "23:10", birth_place: "Paris", gender: "Man", sexual_preference: "Woman", relationship_type: "Serious", element_ranking: ["earth","air","water","fire"], mode_ranking: ["cardinal","fixed","mutable"], personality_traits: ["optimistic", "great sense of humor", "magnanimous"], latitude: 48.86, longitude: 2.33, biography: "Funny, curious but very easily ill-at-ease.", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

gregoire.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Diane Johnston
#file = URI.open('https://avatars2.githubusercontent.com/u/43373459?v=4')

#diane = User.create!(email: "diane@cosmeet.com", password: "123456", name: "Diane", birth_date: "1992-07-16", birth_time: "11:30", birth_place: "Boulogne-Billancourt", gender: "Woman", sexual_preference: "Man", relationship_type: "Serious", element_ranking: ["fire", "earth", "water", "air"], mode_ranking: ["mutable","cardinal","fixed"], personality_traits: ["emotional", "caring", "clingy"], latitude: 48.83, longitude: 2.25, biography: "Dedicated 100percent in what I do, I used to be a fly attendant now I teach how to code to cool people.")

#diane.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Jules
file = URI.open('https://avatars1.githubusercontent.com/u/67333715?v=4')

jules = User.create!(email: "jules@cosmeet.com", password: "123456", name: "Jules", birth_date: "2001-06-20", birth_time: "7:34", birth_place: "Paris", gender: "Man", sexual_preference: "Both", relationship_type: "Curious", element_ranking: ["water","air","earth","fire"], mode_ranking: ["fixed","mutable","cardinal"], personality_traits: ["affectionate", "gentle", "sensitive"], latitude: 48.86, longitude: 2.33, biography: "Sweet as a candy, inaccessible as all green square in Kitt.", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

jules.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Mathilda
file = URI.open('https://avatars0.githubusercontent.com/u/56888912?v=4')

mathilda = User.create!(email: "mathilda@cosmeet.com", password: "123456", name: "Mathilda", birth_date: "1993-05-03", birth_time: "9:55", birth_place: "Nice", gender: "Woman", sexual_preference: "Man", relationship_type: "Serious", element_ranking: ["fire", "earth", "water", "air"], mode_ranking: ["cardinal","fixed","mutable"], personality_traits: ["short-tempered", "productive", "affectionate"], latitude: 43.70, longitude: 7.26, biography: "Hyperactive girl, I mostly hate waste.", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

mathilda.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Chloé
file = URI.open('https://avatars2.githubusercontent.com/u/65725594?v=4')

chloe = User.create!(email: "chloe@cosmeet.com", password:"123456", name: "Chloé", birth_date: "1988-05-08", birth_time: "13:21", birth_place: "Lagny-sur-Marne", gender: "Woman", sexual_preference: "Man", relationship_type: "Serious", element_ranking: ["fire", "earth", "water", "air"], mode_ranking: ["cardinal","fixed","mutable"], personality_traits: ["generous", "proud", "lustful"], latitude: 48.86, longitude: 2.71, biography: "Manager of a music band, I ride Paris with great hair!", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

chloe.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Vivian
file = URI.open('https://avatars1.githubusercontent.com/u/61843515?s=400&u=9cd881da83846f0a1857f9e9eedaa0b3ceb212e8&v=4')

vivian = User.create!(email: "vivian@cosmeet.com", password: "123456", name: "Vivian", birth_date: "1990-01-21", birth_time: "8:015", birth_place: "Rio de Janeiro", sexual_preference: "Man", relationship_type: "Serious", element_ranking: ["fire", "earth", "water", "air"], mode_ranking: ["fixed","mutable","cardinal"], personality_traits: ["intellectual", "intuitive", "original"], latitude: -22.92, longitude: -43.33, biography: "Passionate about fantasy novels, I like to work until my eyes can't see anymore.", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

vivian.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

#User Hugo Lavorel
#file = URI.open('https://avatars2.githubusercontent.com/u/63447451?v=4')

#hugo = User.create!(email: "hugo@cosmeet.com", password: "123456", name: "Hugo L", birth_date: "1990-08-06", birth_time: "18:50", birth_place: "Vitry-sur-seine", gender: "Man", sexual_preference: "Woman", relationship_type: "Serious", element_ranking: ["water","air","earth","fire"], mode_ranking: ["fixed","mutable","cardinal"], personality_traits: ["generous", "idealistic", "lustful"], latitude: 48.78, longitude: 2.4, biography: "I usually seduce with my suave voice. Wait to see my other talents...", age_preference: [25, 35], activities: ["partying", "socializing", "meditation"])

#hugo.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

puts "Adding age infos..."

User.all.each do |user|
  user.age = user.find_age(user.birth_date)
  user.min_age = user.age_preference[0]
  user.max_age = user.age_preference[1]
  user.save!
end

puts "Creating Likes..."

Like.create(user: quentin, receiver: elsa, liked: true)
Like.create(user: oceane, receiver: quentin, liked: true)

# Like.create(user: oceane, receiver: anthony, liked: true)
# Like.create(user: oceane, receiver: dimitri, liked: true)
# Like.create(user: oceane, receiver: edouard, liked: true)
Like.create(user: quentin, receiver: oceane, liked: true)
Like.create(user: anthony, receiver: oceane, liked: true)
Like.create(user: dimitri, receiver: oceane, liked: true)
Like.create(user: edouard, receiver: oceane, liked: true)

puts "Creating Chart Element..."
User.find_each do |user|
  PopulateChartElementJob.perform_later(user)
end
