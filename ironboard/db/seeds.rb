Rake::Task["db:reset"] 

User.delete_all
Event.delete_all
Tag.delete_all
Rsvp.delete_all
EventTag.delete_all

user1 = User.create(name: "Reuben", location: "11218", bio: "good stuff", img_url: "board#{rand(1..10)}.jpeg")
user2 = User.create(name: "Roslynn", location: "11218", bio: "more good stuff", img_url: "board#{rand(1..10)}.jpeg")


event1 = user1.host.events.create(title: "Pizza Party", location: "Flatiron", day: "2015-11-07", start_time: "14:00", end_time: "16:00")
event2 = user2.host.events.create(title: "Ping Pong Whiskey", location: "Flatiron", day: "2015-11-09", start_time: "18:00", end_time: "21:00")


Tag.create(name: "Food")
Tag.create(name: "Funtimes")


user1.guest.events << event2
user2.guest.events << event1
# Rsvp.create(guest_id: 1, event_id: 1)
# Rsvp.create(guest_id: 2, event_id: 1)
# Rsvp.create(guest_id: 2, event_id: 2)

EventTag.create(event_id: 1, tag_id: 1)
EventTag.create(event_id: 2, tag_id: 2)
