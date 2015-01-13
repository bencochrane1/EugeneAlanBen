# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Apartment::Tenant.create('golf')
Apartment::Tenant.switch('golf')


user_one = User.create({
    name: "alan",
    email: "alan@alan.com",
    password: "password"
    })

acc_one = Account.create({
        subdomain: "golf",
        owner: user_one,
        tagline: "Turn into Tiger!",
        description: "This will teach you to become Tiger Woods real quick."
    })


