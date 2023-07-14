puts "Seeding data"
Photo.destroy_all
Category.destroy_all

category = Category.create(name:"Nature", description:"This is a great category")
photo = Photo.create(title: "Lonely bird", description: "This is a great photo", category: category)

puts "Ending Seed"