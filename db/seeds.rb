require 'faker'

10.times do
	city = City.create(city_name: Faker::Address.city, postal_code: Faker::Address.postcode)
end

10.times do
	user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::MichaelScott.quote, email: Faker::Internet.email, age: Faker::Number.between(12, 25), city_id: rand((City.first.id)..(City.last.id)))
end

20.times do
	gossip = Gossip.create(gossip_title: Faker::FunnyName.name, gossip_content: Faker::HowIMetYourMother.quote, gossip_date: "2018-07-26 12:00:00".to_datetime, user_id: rand((User.first.id)..(User.last.id)))
end

10.times do
	tag = Tag.create(title_tag: Faker::HowIMetYourMother.catch_phrase)
end

for i in ((Tag.first.id)..(Tag.last.id))
	gossip = Gossip.find(i)
	tag = Tag.find(i)
	gossip.tags << tag
end

10.times do
	gossip_id = rand ((Gossip.first.id)..(Gossip.last.id))
	tag_id = rand((Tag.first.id)..(Tag.last.id))
	gossip = Gossip.find(gossip_id)
	tag = Tag.find(tag_id)
	gossip.tags << tag
end

1.times do
	privatemessage = Privatemessage.create(message_content: Faker::DrWho.quote, message_date: "2018-07-26 10:00:00".to_datetime, recipient_id: rand((User.first.id)..(User.last.id)), sender_id: rand((User.first.id)..(User.last.id)))
end

20.times do
	comment = Comment.create(comment_content: Faker::ChuckNorris.fact, gossip_id: rand((Gossip.first.id)..(Gossip.last.id)), user_id: rand((User.first.id)..(User.last.id)))
end

20.times do
	randomizer = rand(1..2)
	if randomizer.modulo(2) == 0
		like = Like.create(user_id: rand((User.first.id)..(User.last.id)), likeable_type: "Comment", likeable_id: rand((Comment.first.id)..(Comment.last.id)))
	else
		like = Like.create(user_id: rand((User.first.id)..(User.last.id)), likeable_type: "Gossip", likeable_id: rand((Gossip.first.id)..(Gossip.last.id)))
	end
end