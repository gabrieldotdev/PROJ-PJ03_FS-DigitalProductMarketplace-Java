create database digitalproducts;
use digitalproducts;

-- Create the 'users' table for storing user information
CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `phone` varchar(20),
  `location` varchar(200),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create the 'images' table for storing image information
CREATE TABLE images (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  file_path VARCHAR(255) NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create the 'albums' table for storing album information
CREATE TABLE albums (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create the 'album_images' table for connecting albums and images
CREATE TABLE album_images (
  id INT PRIMARY KEY AUTO_INCREMENT,
  album_id INT NOT NULL,
  image_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albums(id),
  FOREIGN KEY (image_id) REFERENCES images(id)
);

-- Create the 'purchases' table for storing purchase information
CREATE TABLE purchases (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  image_id INT,
  album_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (image_id) REFERENCES images(id),
  FOREIGN KEY (album_id) REFERENCES albums(id)
);

-- Insert data into the 'users' table:

INSERT INTO users (username, email, password, phone, location)
VALUES
('johndoe', 'johndoe@gmail.com', 'mypassword', '1234567890', 'Los Angeles, CA'),
('janedoe', 'janedoe@gmail.com', 'mypassword', '0987654321', 'New York, NY'),
('bobsmith', 'bobsmith@gmail.com', 'mypassword', '555-555-5555', 'San Francisco, CA');

-- Insert data into the 'images' table:

INSERT INTO images (user_id, title, file_path, description, price)
VALUES
(1, 'Landscape 1', 'https://images.unsplash.com/photo-1680363470732-4760c2a2a777?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80', 'A beautiful landscape scene with mountains and a river', 10.99),
(1, 'Portrait 1', 'https://images.unsplash.com/photo-1680363470732-4760c2a2a777?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80', 'A portrait of a young woman', 15.99),
(2, 'Nature 1', 'https://images.unsplash.com/photo-1680363470732-4760c2a2a777?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80', 'A close-up of a colorful butterfly on a flower', 8.99),
(2, 'Landscape 2', 'https://images.unsplash.com/photo-1680363470732-4760c2a2a777?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80', 'A sunset over the ocean', 12.99);

-- Insert data into the 'albums' table:

INSERT INTO albums (user_id, title, description, price)
VALUES
(1, 'Summer Vacation', 'Photos from our summer trip to the beach', 25.99),
(2, 'Nature Photography', 'A collection of nature photos', 18.99);

-- Insert data into the 'album_images' table:

INSERT INTO album_images (album_id, image_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4);

-- Insert data into the 'purchases' table:

INSERT INTO purchases (user_id, image_id, album_id)
VALUES
(1, 2, NULL),
(2, NULL, 1);