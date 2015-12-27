# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Degree.create([{name: 'Mgr.'}, {name: 'Dr.'}, {name: 'PhDr.'}])
d = Degree.create(name: 'Ing.')
d.users.new(email: 'bercob@gmail.com', crypted_password: '$2a$10$Hzw4Gwe4eiUfVRp.uRg40OYQzutu1g.LLG9NSf/Ixc1hfxeMOVSum', salt: 'XXyyogy5eD9gDhxgvssz', admin: true).save(validate: false)
Language.create([{name: 'english'}, {name: 'slovak'}, {name: 'german'}, {name: 'hungarian'}])