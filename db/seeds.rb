# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Admin
#
User.delete_all
Book.delete_all
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
admin.confirm!

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
normie.confirm!

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

users = []
  ('A'..'Z').each do |last_name|
    user = User.create!(
      :email => "#{last_name}@railsbookcheckout.com",
      :firstname => 'Erica',
      :lastname => last_name,
      :password => 'p455w0rd'
    )
    user.confirm!
    users << user
  end
  @all_books = []
  users.each do |user|
    users_name = "#{user.firstname} #{user.lastname}"
    (1..10).each do |n|
      @all_books << Book.create!( user: user,
                                              :author => user.email,
                                              :title => "The Autobiography of #{users_name} Vol. #{n}",
                                              :isbn => "9999#{n}",
                                              # only activate some of them
                                              :active => (n<6),
                                              :approved_at => (n<6) ? Time.now : nil
                                             )
    end
  end
