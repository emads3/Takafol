puts 'Running Case seeder..'

# insert cases of charities
# get charities in batches of 1000, not to get them all and cause memory problems
Charity.take(30).each do |ch|
  (1..10).to_a.sample.times do
    ch.cases.create(
      name: Faker::Name.unique.name,
      job: Faker::Job.position,
      description: Faker::Quote.famous_last_words,
      children_num: Faker::Number.between(from: 0, to: 20),
      marital_status: %w[single divorced].sample,
      priority: Faker::Number.between(from: 0, to: 5),
      # address: Faker::Address.unique.full_address,
      city_id: Faker::Number.between(from: 1, to: 250),
      phone: Faker::PhoneNumber.unique.cell_phone_with_country_code,
      national_id: Faker::IDNumber.ssn_valid
    ).save(validate: false)
  end
end

# insert cases without charities
15.times do
  Case.create(
    name: Faker::Name.unique.name,
    job: Faker::Job.position,
    description: Faker::Quote.famous_last_words,
    children_num: Faker::Number.between(from: 0, to: 20),
    marital_status: %w[single divorced].sample,
    priority: Faker::Number.between(from: 0, to: 5),
    # address: Faker::Address.unique.full_address,
    city_id: Faker::Number.between(from: 1, to: 250),
    phone: Faker::PhoneNumber.unique.cell_phone_with_country_code,
    national_id: Faker::IDNumber.ssn_valid
  ).save(validate: false)
end
puts 'Case seeder done successfully..'

