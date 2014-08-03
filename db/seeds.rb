# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Admin
User.create!( firstname: 'Admin',
              lastname: 'Admin',
              email: 'a@a.com',
              admin: true,
              address: '123 Fake Street',
              city: 'Seattle',
              state: 'WA',
              phone: '123-444-5556',
              password: '12345678',
              password_confirmation: '12345678'
)

#Normie
User.create!( firstname: 'Tom',
              lastname: 'Fakerson',
              email: 'b@b.com',
              admin: false,
              address: '123 Fake Street',
              city: 'Seattle',
              state: 'WA',
              phone: '123-444-5556',
              password: '12345678',
              password_confirmation: '12345678'
)