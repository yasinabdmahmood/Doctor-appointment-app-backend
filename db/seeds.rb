# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
accounts = Account.create([
    {
        name: 'admin',
        username: 'admin',
        email: 'admin@gmail.com',
        password: 'admin123'
    },
    {
        name: 'Yaseen',
        username: 'Yaseen_Y',
        email: 'yaseen@gmail.com',
        password: '123456'
    }
])

admins = Admin.create([
    {
        account: accounts[0]
    }
])

doctors = Doctor.create([
    {
        name: 'Emily Williams',
        picture: 'https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHdvbWFuJTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=300&q=60',
        speciality: 'Cardiologist',
        bio: "Dr. Williams is a highly skilled cardiologist with over 10 years of experience in the field. She specializes in the diagnosis and treatment of heart and blood vessel conditions, and is known for her compassionate bedside manner and dedication to her patients' well-being"
    },
    {
        name: 'Michael Chen',
        picture: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
        speciality: 'Oncologist',
        bio: "Dr. Chen is a renowned oncologist with a particular expertise in the treatment of lung cancer. He has published numerous research papers in leading medical journals and is regularly invited to speak at conferences and symposiums around the world. He is known for his innovative approach to cancer treatment and his commitment to providing the best possible care for his patients"
    }
])

reservations = Reservation.create([
    {
        city: 'Berlin',
        date: '2023/5/1',
        account: accounts[0],
        doctor: doctors[0],
    },
    {
        city: 'New-York',
        date: '2023/5/2',
        account: accounts[0],
        doctor: doctors[1],
    },
    {
        city: 'Madrid',
        date: '2023/5/3',
        account: accounts[1],
        doctor: doctors[0],
    },
    {
        city: 'Paris',
        date: '2023/5/4',
        account: accounts[1],
        doctor: doctors[1],
    },
])