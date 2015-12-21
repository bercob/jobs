# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([{email: 'bercob@gmail.com'}, {crypted_password: '$2a$10$Hzw4Gwe4eiUfVRp.uRg40OYQzutu1g.LLG9NSf/Ixc1hfxeMOVSum'}, {salt: 'XXyyogy5eD9gDhxgvssz'}])
