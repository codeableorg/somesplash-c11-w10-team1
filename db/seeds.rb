puts "Sending data"
# Comment.destroy_all
Photo.destroy_all
Category.destroy_all
wallpaper = Category.create(name: "Wallpapers", 
  description: "This is a category Wallpapers")
wallpaper.cover.attach(io: File.open("db/images/wallpaper.png"), filename: "wallpaper")
nature = Category.create(name: "Nature", 
  description: "This is a category Nature")
nature.cover.attach(io: File.open("db/images/nature.png"), filename: "nature")
people = Category.create(name: "People", 
  description: "This is a category People")
people.cover.attach(io: File.open("db/images/people.png"), filename: "people")



lake = Photo.create(title: "Purple Lake", 
                    description: "Nice and big purple lake",
                    category: nature)
lake.image.attach(io: File.open("db/images/lake.png"), filename: "Lake")
puts "ending seed"

