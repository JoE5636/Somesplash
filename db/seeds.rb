puts "Seeding - START"

Comment.destroy_all
Photo.destroy_all
Category.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('comments')
ActiveRecord::Base.connection.reset_pk_sequence!('photos')
ActiveRecord::Base.connection.reset_pk_sequence!('categories')

puts "Seeding Categories"

wallpaper = Category.create(
    name: "Wallpaper", 
    description: "From epic drone shots to inspiring moments in nature, find free HD wallpapers worthy of your screens."
)
wallpaper.cover.attach(io: File.open('db/images/wallpapers.png'), filename: 'wallpapers.png')

nature = Category.create(
    name: "Nature",
    description: "Let’s celebrate the magic of Mother Earth — with images of everything our planet has to offer."
)
nature.cover.attach(io: File.open('db/images/nature.png'), filename: 'nature.png')

people = Category.create(
    name: "People", 
    description: "Real people, captured. Photography has the power to reflect the world around us, give voice to individuals and groups."
)
people.cover.attach(io: File.open('db/images/people.png'), filename: 'people.png')

puts "Seeding Comments Category"

comment_category_1 = Comment.create(
    body: "hola mundo",
    commentable: nature
)

comment_category_2 = Comment.create(
    body: "hola mundo 2",
    commentable: nature
)

comment_category_3 = Comment.create(
    body: "hola mundo 3",
    commentable: nature
)

puts "Seeding Photos"

purple = Photo.create(
    title: "Purple lake", 
    description: "Purple Lake was beautiful. We camped down the trail Cascade Valley, as you must camp 300 feet from the outage", 
    category: nature)
    purple.image.attach(io: File.open('db/images/purple.png'), filename: 'purple.png')
    
green = Photo.create(
    title: "Green plant",
    description: "Nice plant", 
    category: nature)
    green.image.attach(io: File.open('db/images/green_plant.png'), filename: 'green_plant.png')

bird = Photo.create(
    title: "Lonely bird",
    description: "A tiny paper bird shares a home with humans in this wondrously illustrated debut, introducing a sensitive.", 
    category: nature)
    bird.image.attach(io: File.open('db/images/lonely_bird.png'), filename: 'lonely_bird.png')

puts "Seeding Comments Photos"

comment_photo_1 = Comment.create(
    body: "Prueba 1",
    commentable: purple
)

comment_photo_2 = Comment.create(
    body: "Prueba 2",
    commentable: purple
)

comment_photo_3 = Comment.create(
    body: "Prueba 3",
    commentable: purple
)