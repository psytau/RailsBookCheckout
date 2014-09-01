# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Admin
admin = User.create!( firstname: 'Admin',
              lastname: 'Admin',
              email: 'a@a.com',
              # admin: true, # use rolify instead of a db flag
              address: '123 Fake Street',
              city: 'Seattle',
              state: 'WA',
              phone: '123-444-5556',
              password: '12345678',
              password_confirmation: '12345678'
)

admin.add_role "admin"

#Normie
normie = User.create!( firstname: 'Tom',
              lastname: 'Fakerson',
              email: 'b@b.com',
              # admin: false,
              address: '123 Fake Street',
              city: 'Seattle',
              state: 'WA',
              phone: '123-444-5556',
              password: '12345678',
              password_confirmation: '12345678'
)

book = Book.create!( author: 'Steven King',
              title: 'IT',
              status: 'Available',
              isbn: '32T09JV4OV4IN3409J',
              active: true,
              approved_at: Time.now,
              user: normie

  )

Book.create!( author: 'Stephen Baxter',
              title: 'Vacuum Diagrams',
              status: 'Available',
              isbn: '0061059048',
              active: true,
              approved_at: Time.now,
              user: normie
)

Rating.create!(user: normie,
               book: book,
               score: 3)

#Trigger Events
event_1 = trigger_events.create!( subject: 'You have been Invited!',
                                  text: 'Hello!

                                        Someone thought you would enjoy Rails Book Checkout! 
                                        Please, check us out at http://railsbookcheckout.herokuapp.com')

event_2 = trigger_events.create!( subject: 'A book has been reviewed!',
                                  text: 'Log into Rails Book Checkout to see which book has been reviewed!')

event_3 = trigger_events.create!( subject: 'A book has been rated!',
                                  text: 'Log into Rails Book Checkout to see which book has been rated!')

event_4 = trigger_events.create!( subject: 'You have been invited as an admin',
                                  text: 'Hello!

                                          You have been invited to join Rail book Checkout as an admin. 
                                          Please go to http://railsbookcheckout.herokuapp.com.')

