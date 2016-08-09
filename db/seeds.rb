# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def user_name
  Faker::Internet.user_name
end

def email
  Faker::Internet.email
end

def password
  Faker::Internet.password(8)
end

def address
  Faker::Address.street_address
end

def city
  Faker::Address.city
end

def state
  Faker::Address.state
end

def zip
  Faker::Address.zip
end


def image
  Faker::Avatar.image("my-own-slug", "50x50", "jpg")
end

user_list = [
  [user_name, email, password, address, city, state, zip],
  [user_name, email, password, address, city, state, zip],
  [user_name, email, password, address, city, state, zip],
  [user_name, email, password, address, city, state, zip],
  [user_name, email, password, address, city, state, zip],
  [user_name, email, password, address, city, state, zip],
  [user_name, email, password, address, city, state, zip],
  [user_name, email, password, address, city, state, zip],
  [user_name, email, password, address, city, state, zip],
  [user_name, email, password, address, city, state, zip],
  [user_name, email, password, address, city, state, zip],
  [user_name, email, password, address, city, state, zip],
  [user_name, email, password, address, city, state, zip],
  [user_name, email, password, address, city, state, zip],
  [user_name, email, password, address, city, state, zip],
  [user_name, email, password, address, city, state, zip]
]

user_list.each do |user_name, email, password, address, city, state, zip|
  User.create( username: user_name, email: email, password: password, address: address, city: city, state: state, zip: zip)
end
