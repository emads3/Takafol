puts 'Running donor seeder..'

25.times do
  Donor.create(
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password,
    name: Faker::Name.unique.name,
    national_id: Faker::IDNumber.ssn_valid,
    # national_id_img:
    address: Faker::Address.unique.full_address,
    # phone_number: Faker::PhoneNumber.unique.cell_phone_with_country_code
  ).save(validate: false)
end
puts 'Donor seeder done successfully..\n\n'

