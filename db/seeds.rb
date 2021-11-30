# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Account.create(name: 'Personal')
Account.create(name: 'Professional')
Account.create(name: 'Enterprise')

Bank.create(name: 'BMO')
Bank.create(name: 'BNC')
Bank.create(name: 'Tangerine')

Transaction.create(description: 'Phone', amount: '59.99', account_id: 1, bank_id: 1)
Transaction.create(description: 'Phone', amount: '59.99', account_id: 1, bank_id: 1)
Transaction.create(description: 'Gym', amount: '19.99', account_id: 1, bank_id: 1)
Transaction.create(description: 'Gym', amount: '29.99', account_id: 1, bank_id: 1)


