# Doctors Appointment

## Introduction
 
The following API documentation outlines the endpoints for a doctor appointment scheduling application. The endpoints include the ability to register a new user, login, view available doctors, schedule appointments, and view upcoming appointments for a logged in user. Each endpoint includes the relevant URL, HTTP method, expected data in the request body (if applicable), and the expected response in JSON format. Example code is also provided for reference on how to use the endpoint in a JavaScript application using the axios library.

## Authentication
The API documentation outlined above includes two endpoints that handle authentication, specifically "Register new user" and "Login". When a user logs in successfully, they will receive a JSON response that includes a token. This token should be saved by the user and included in the header of every subsequent request to access protected endpoints.


## End points

- **Register new user** : This end point is used to sign up a new user
   - Endpoint: https://doctor-appointment-hbcv.onrender.com/users
   - Method: POST
   - Request Body: JSON data including name, username, email, and password
  ```javascript
  {
      name: 'Ali',
      username: 'ALI_M',
      email: "ali123@gmail.com",
      password: "123456"
  }
  ```

   - Response: JSON data including id, name, username, email, password_digest, isAdmin, created_at, and updated_at
   - Example Response:
  ```
   {
      "id": 4,
      "name": "Ali",
      "username": "ALI_M",
      "email": "ali123@gmail.com",
      "password_digest": "$2a$12$kuXk5y71wUjnTrzZTOnVfOC33IhEtnyC4oOoAWNd8imUf5tZxFegC",
      "isAdmin": false,
      "created_at": "2023-01-24T16:59:26.977Z",
      "updated_at": "2023-01-24T16:59:26.977Z"
  }
  ```
   - Example Code:
  ```javascript
  const axios = require('axios');
  axios.post('https://doctor-appointment-hbcv.onrender.com/users', {name: 'John Smith', username: 'testusername', email: "john@gmail", password: "123456"})
    .then(response => {
      console.log(response.data);
    })
    .catch(error => {
      console.log(error);
    });
  ```

- **Login** : This end point is used to login 
   - Endpoint: https://doctor-appointment-hbcv.onrender.com/auth/login
   - Method: POST
   - Request Body: JSON data including name, username, email, and password
  ```javascript
  {
      email: "ali123@gmail.com",
      password: "123456"
  }
  ```

   - Response: JSON data including token and is_admin
   - Example Response:
  ```
   {
      "token": "eyJhbGciOiJIUzI1NiJ9.eyJhY2NvdW50X2lkIjoyLCJleHAiOjE2NzUxODMzMzN9.QaXuISDXN2axaUa7Zu1uiuVkDAbVtp4Ce21MteJvyjQ",
      "is_admin": true
  }
  ```
   - Example Code:
  ```javascript
  const axios = require('axios');
  axios.post('https://doctor-appointment-hbcv.onrender.com/auth/login', {email: "user1@gmail.com", password: "123456"})
    .then(response => {
      console.log(response.data);
    })
    .catch(error => {
      console.log(error);
  });
  ```

- **Get doctors** : this end point returns a list of available doctors
   - Endpoint: https://doctor-appointment-hbcv.onrender.com/doctors
   - Method: GET

   - Response: JSON data including of doctors with thier details
   - Example Response:
  ```
   [
      {
          "id": 1,
          "name": "doctor1",
          "picture": "picture1",
          "speciality": "speciality1",
          "bio": "bio1",
          "created_at": "2023-01-24T16:31:24.320Z",
          "updated_at": "2023-01-24T16:31:24.320Z"
      },
      {
          "id": 2,
          "name": "doctor2",
          "picture": "picture2",
          "speciality": "speciality2",
          "bio": "bio2",
          "created_at": "2023-01-24T16:31:24.327Z",
          "updated_at": "2023-01-24T16:31:24.327Z"
      },
      {
          "id": 3,
          "name": "doctor1",
          "picture": "picture1",
          "speciality": "speciality1",
          "bio": "bio1",
          "created_at": "2023-01-24T16:58:28.761Z",
          "updated_at": "2023-01-24T16:58:28.761Z"
      },
      {
          "id": 4,
          "name": "doctor2",
          "picture": "picture2",
          "speciality": "speciality2",
          "bio": "bio2",
          "created_at": "2023-01-24T16:58:28.813Z",
          "updated_at": "2023-01-24T16:58:28.813Z"
      }
  ]
  ```
   - Example Code:
  ```javascript
  const axios = require('axios');
  axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
  axios.get('https://doctor-appointment-hbcv.onrender.com/doctors')
    .then(response => {
      console.log(response.data);
    })
    .catch(error => {
      console.log(error);
  });
  ```

- **Create new doctor** : this end point is responsible for creating a new doctor
   > **Important note**
   >only admins can create new doctor if you want to create new doctor
   >you have to login as admin with the follwing email and password
   >- email: user1@gmail.com
   >- password: 123456
   - Endpoint: https://doctor-appointment-hbcv.onrender.com/doctors
   - Method: POST
   - Request Body: JSON data including name, picture, speciality, and bio
  ```javascript
  {  
         name: 'John Smith',
         picture: 'dummy link',
         speciality: 'Family Medicine',
         bio: 'Dr. John Smith is a highly skilled and compassionate family physician with over 10 years of experience in providing top-notch medical care to patients of all ages. He is dedicated to helping his patients achieve optimal health through preventative care, early diagnosis, and evidence-based treatment. He is also known for his ability to connect with patients on a personal level and for providing a warm and welcoming environment for his patients.\"\nPlease keep in mind that the above information is purely fictional and any medical advice or treatment should be taken only by a licensed professional.'
  }
  ```

   - Response: JSON data including the doctor that has been created along with other details about the doctor
   - Example Response:
  ```
   {
      "id": 5,
      "name": "John Smith",
      "picture": "dummy link",
      "speciality": "Family Medicine",
      "bio": "Dr. John Smith is a highly skilled and compassionate family physician with over 10 years of experience in providing top-notch medical care to patients of all ages. He is dedicated to helping his patients achieve optimal health through preventative care, early diagnosis, and evidence-based treatment. He is also known for his ability to connect with patients on a personal level and for providing a warm and welcoming environment for his patients.\"\nPlease keep in mind that the above information is purely fictional and any medical advice or treatment should be taken only by a licensed professional.",
      "created_at": "2023-01-24T17:37:57.755Z",
      "updated_at": "2023-01-24T17:37:57.755Z"
  }
  ```
   - Example Code:
  ```javascript
  const axios = require('axios');
  axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
  axios.post('https://doctor-appointment-hbcv.onrender.com/doctors',{name: 'test_name', picture: 'test_picture',speciality: 'test_speciality',bio: 'test_bio'})
    .then(response => {
      console.log(response.data);
    })
    .catch(error => {
      console.log(error);
  });
  ```

- **Get reservations** : This end point returns a list of the reservations the user has created by the logged in user
   - Endpoint: https://doctor-appointment-hbcv.onrender.com/reservations
   - Method: GET

   - Response: JSON data including the list of all reservations created by the logged-in user
   - Example Response:
  ```
   [
    {
      id: 1,
      city: 'Berlin',
      date: '2023-05-01',
      doctor_id: 1,
      account_id: 2,
      created_at: '2023-01-24T16:31:24.352Z',
      updated_at: '2023-01-24T16:31:24.352Z'
    },
    {
      id: 2,
      city: 'New-York',
      date: '2023-05-02',
      doctor_id: 2,
      account_id: 2,
      created_at: '2023-01-24T16:31:24.360Z',
      updated_at: '2023-01-24T16:31:24.360Z'
    }
  ]
  ```
   - Example Code:
  ```javascript
  const axios = require('axios');
  axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
  axios.get('https://doctor-appointment-hbcv.onrender.com/reservations')
    .then(response => {
      console.log(response.data);
    })
    .catch(error => {
      console.log(error);
  });
  ```

- **Create reservation** : This end point is responsible for creating reservation for the logged-in user
   - Endpoint: https://doctor-appointment-hbcv.onrender.com/reservations
   - Method: POST
   - Request Body: JSON data including date, city, and doctor_id
  ```javascript
  {
      date: '2022-5-1',
      city: 'test_city',
      doctor_id: 2
  }
  ```

   - Response: JSON data including all the details about created reservation
   - Example Response:
  ```
   {
    id: 6,
    city: 'test_city',
    date: '2022-05-01',
    doctor_id: 2,
    account_id: 2,
    created_at: '2023-01-24T19:43:53.352Z',
    updated_at: '2023-01-24T19:43:53.352Z'
  }
  ```
   - Example Code:
  ```javascript
  const axios = require('axios');
  axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
  axios.post('https://doctor-appointment-hbcv.onrender.com/reservations',{date: '2022-5-1', city: 'test_city',doctor_id: 2})
    .then(response => {
      console.log(response.data);
    })
    .catch(error => {
      console.log(error);
  });
  ```



