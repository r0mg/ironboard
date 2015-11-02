# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "Reuben", location: "11218", bio: "good stuff")
User.create(name: "Roslynn", location: "11218", bio: "more good stuff")

Event.create(title: "Pizza Party", location: "Flatiron", day: "2015-11-07", start_time: "14:00", end_time: "16:00")
Event.create(title: "Ping Pong Whiskey", location: "Flatiron", day: "2015-11-09", start_time: "18:00", end_time: "21:00")

Tag.create(name: "Food")
Tag.create(name: "Funtimes")

Rsvp.create(guest_id: 1, event_id: 1)
Rsvp.create(guest_id: 2, event_id: 1)
Rsvp.create(guest_id: 2, event_id: 2)

EventTag.create(event_id: 1, tag_id: 1)
EventTag.create(event_id: 2, tag_id: 2)
