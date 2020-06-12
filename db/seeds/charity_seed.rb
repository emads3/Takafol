puts 'Running charity seeder..'

50.times do
  Charity.create(
    email: Faker::Internet.unique.email,
    password: '123123',
    name: Faker::Restaurant.unique.name,
    address: Faker::Address.unique.full_address,
    phone_number: Faker::PhoneNumber.unique.cell_phone_with_country_code,
    description: Faker::Restaurant.description
  ).save(validate: false)
end
# create custom one for personal use
Charity.create(
  email: 'test@gmail.com',
  password: '123123123',
  name: 'Test Charity Name',
  address: 'Alexandria Charities Center',
  phone_number: '+20111111111',
  description: 'This is the description of the charity'
).save(validate: false)
puts 'Charity seeder done successfully..\n\n'
