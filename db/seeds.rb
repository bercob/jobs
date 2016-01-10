degrees = ['Ing.', 'Mgr.', 'Dr.', 'PhDr.']
last_degree = degrees.map { |degree| Degree.create name: degree }.first

user = last_degree.users.new(email: 'bercob@gmail.com', admin: true)
user.password = 'admin'
user.password_confirmation = 'admin'
user.save


Language.create([{name: 'english'}, {name: 'slovak'}, {name: 'german'}, {name: 'hungarian'}])

OfferSource.create([{name: 'local'}, {name: 'profesia.sk'}])
