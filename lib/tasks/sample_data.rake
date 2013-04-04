namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!( name: "gulunmu",
                 email: "gulunmu@163.com",
                 password:"gulunmu",
                 password_confirmation:"gulunmu")

    admin.toggle!(:admin)


    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@rails.com"
      password = "password"
      User.create!(name:name,
                   email:email,
                   password:password,
                   password_confirmation:password)
    end

  end

end
