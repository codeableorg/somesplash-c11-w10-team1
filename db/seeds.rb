puts "Sending data"
Comment.destroy_all
Photo.destroy_all
Category.destroy_all
wallpaper = Category.create(name: "Wallpapers", 
  description: "From epic drone shots to inspiring moments in nature, find free HD wallpapers worthy of your screens. Max 130 char.")
wallpaper.cover.attach(io: File.open("db/images/wallpaper.png"), filename: "wallpaper")
nature = Category.create(name: "Nature", 
  description: "Let’s celebrate the magic of Mother Earth — with images of everything our planet has to offer.")
nature.cover.attach(io: File.open("db/images/nature.png"), filename: "nature")
people = Category.create(name: "People", 
  description: "This is a category People")
people.cover.attach(io: File.open("db/images/people.png"), filename: "people")

lake = Photo.create(title: "Purple Lake", 
                    description: "Nice and big purple lake",
                    category: nature)
lake.image.attach(io: File.open("db/images/lake.png"), filename: "Lake")


hoja = Photo.create(title: "Green leaf", 
  description: "Nice green leaf",
  category: nature)
hoja.image.attach(io: File.open("db/images/image5.png"), filename: "Green leaf")


wall1 = Photo.create(title: "Wallpaper 1", 
  description: "Nice Wallpaper",
  category: wallpaper)
wall1.image.attach(io: File.open("db/images/image17.png"), filename: "Wallpaper 1")

wall2 = Photo.create(title: "Wallpaper 2", 
  description: "Nice Wallpaper 2",
  category: wallpaper)
wall2.image.attach(io: File.open("db/images/image18.png"), filename: "Wallpaper 2")

peop1 = Photo.create(title: "Woman 1", 
  description: "Nice Woman",
  category: people)
peop1.image.attach(io: File.open("db/images/image21.png"), filename: "Woman")

peop2 = Photo.create(title: "Woman 2", 
  description: "Nice Woman 2",
  category: people)
peop2.image.attach(io: File.open("db/images/image22.png"), filename: "Woman 2")

# Crear comentarios para la foto "Purple Lake"
lake.comments.create(comment: "Beautiful scenery!")
lake.comments.create(comment: "I love the colors!")

# wallpaper = Category.create(name: "Wallpapers", description: "This is a category Wallpapers")
# wallpaper.cover.attach(io: File.open("db/images/wallpaper.png"), filename: "wallpaper")

wallpaper.comments.create(comment: "Amazing collection!")
wallpaper.comments.create(comment: "Great wallpapers for my desktop!")
nature.comments.create(comment: "Beautiful scenery!")
nature.comments.create(comment: "This is an example of a comment for this category.")

puts "ending seed"

