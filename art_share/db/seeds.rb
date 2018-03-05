# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{username: 'frog'}, {username: 'rabbit'}, {username: 'cat'}])
artworks = ArtWork.create([{title: 'self_portrait', image_url:
  'https://img.purch.com/w/660/aHR0cDovL3d3dy5saXZlc2NpZW5jZS5jb20vaW1hZ2VzL2kvMDAwLzA1MC81ODUvb3JpZ2luYWwvc2h1dHRlcnN0b2NrXzk0MTg0NDI1LmpwZw==',
  artist_id: 1},
  {title: 'Rabbit Hole',image_url:'https://cdn-images-1.medium.com/max/1200/1*xUVx8GVAl1AFgb9wp-PlyA.jpeg', artist_id:2},
  {title: 'Catnip',image_url:'https://i.pinimg.com/originals/d6/93/9e/d6939e71dc96810673c12cdde3b92dbb.jpg', artist_id:3}])
artworkshares = ArtworkShare.create([{artwork_id:1,viewer_id:2},{artwork_id:2,viewer_id:3},
  {artwork_id:3,viewer_id:1},{artwork_id: 2,viewer_id:1},{artwork_id:3,viewer_id: 2}])
