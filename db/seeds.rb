# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = User.create([
    {
        name: 'user1',
        username: 'username1',
        email: 'user1@gmail.com',
        password: '123456'
    },
    {
        name: 'user2',
        username: 'username2',
        email: 'user2@gmail.com',
        password: '123456'
    }
])

admins = Admin.create([
    {
        user: users[0]
    }
])

doctors = Doctor.create([
    {
        name: 'doctor1',
        picture: 'picture1',
        speciality: 'speciality1',
        bio: 'bio1'
    },
    {
        name: 'doctor2',
        picture: 'picture2',
        speciality: 'speciality2',
        bio: 'bio2'
    }
])

reservations = Reservation.create([
    {
        city: 'Berlin',
        date: '2023/5/1',
        user: users[0],
        doctor: doctors[0]
    },
    {
        city: 'New-York',
        date: '2023/5/2',
        user: users[0],
        doctor: doctors[1]
    },
    {
        city: 'Madrid',
        date: '2023/5/3',
        user: users[1],
        doctor: doctors[0]
    },
    {
        city: 'Paris',
        date: '2023/5/4',
        user: users[1],
        doctor: doctors[1]
    },
])