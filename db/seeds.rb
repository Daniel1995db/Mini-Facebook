# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([
	{id: 1, fname: 'Pablo', lname: 'Escobar', username: 'donpablo', password: 'test', photo: open('http://static4.businessinsider.com/image/55fee5be9dd7cc11008bbaa4-480/pablo-escobar.jpg'), position: 'Leader' },
	{id: 2, fname: 'Gustavo', lname: 'Gaviria', username: 'gg', password: 'test', photo: open('https://images-na.ssl-images-amazon.com/images/M/MV5BMTQ3OTk4Njg2NV5BMl5BanBnXkFtZTgwMzIzMzk2NjE@._V1_SY1000_SX1500_AL_.jpg'), position: 'primo' }
])
Post.create([
	{id: 1, message: 'Plata O Plomo', photo: open('http://pbs.twimg.com/media/CO_TUKkWUAAIN4o.jpg'), user_id: 1}
])
Comment.create([
	{id: 1, message: "Fuckin' gringos!", post_id: 1, user_id: 2,}
])
