Rake::Task["db:reset"] 

User.delete_all
Event.delete_all
Tag.delete_all
Rsvp.delete_all
EventTag.delete_all

user1 = User.create(name: "Reuben", location: "11218", bio: "good stuff", 
	img_url: "board#{rand(1..10)}.jpeg", password: "password", password_confirmation: "password")
user2 = User.create(name: "Roslynn", location: "11218", bio: "more good stuff", 
	img_url: "board#{rand(1..10)}.jpeg", password: "password", password_confirmation: "password")
user3 = User.create(name: "matthew", location: "11211", bio: "yeah", password: "a", password_confirmation: "a")


20.times do |i|
	user = User.new
	user.name = Faker::Name.name
	user.bio = [Faker::Hacker.adjective,Faker::Hacker.noun].join(' ')
	user.location = Faker::Address.zip
	user.img_url = "board#{rand(1..10)}.jpeg"
	user.email = Faker::Internet.email
	user.password = "password"
	user.password_confirmation = "password"
	user.build_host
	user.build_guest
	user.save
end


user1.build_host
user1.build_guest
user1.save

user2.build_host
user2.build_guest
user2.save

user3.build_host
user3.build_guest
user3.save

event1 = user1.host.events.create(title: "Pizza Party", location: "Flatiron", day: "2015-11-07", start_time: "14:00", end_time: "16:00")
event2 = user2.host.events.create(title: "Ping Pong Whiskey", location: "Flatiron", day: "2015-11-09", start_time: "18:00", end_time: "21:00")


event_suffixes = ['potluck','hangout','dance party','trip','bonanza','tournament']
tag_names = ['pizza','whiskey','cats','dogs','school','books','naptime','wut']
50.times do |i|
	event = User.all.sample.host.events.build
	event.title = [Faker::App.name,Faker::Hacker.adjective,Faker::Hacker.noun,event_suffixes.sample].join(' ')
	event.location = Faker::Address.zip
	event.day = Faker::Date.between(7.days.ago, Date.today)
	event.start_time = "#{rand(10..20)}:00"
	event.end_time = event.start_time+rand(60*60*0.5 .. 60*60*4)
	event.save
	event.tags.create(name: tag_names.sample)
end

event1.tags.create(name: "pizza")
event1.tags.create(name: "awesome")

event2.tags.create(name: "ping pong")
event2.tags.create(name: "whiskey")

user1.guest.events << event2
user2.guest.events << event1

User.all.each do |user|
	4.times do
		event = Event.all.sample
		if event.host.user != user && !event.guests.include?(user.guest)
			user.guest.events << event
		end
	end
end
# EventTag.create(event_id: 1, tag_id: 1)
# EventTag.create(event_id: 2, tag_id: 2)
