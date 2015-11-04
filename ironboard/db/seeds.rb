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

event1.tags.create(name: "pizza")
event1.tags.create(name: "awesome")

event2.tags.create(name: "ping pong")
event2.tags.create(name: "whiskey")

user1.guest.events << event2
user2.guest.events << event1

EventTag.create(event_id: 1, tag_id: 1)
EventTag.create(event_id: 2, tag_id: 2)
