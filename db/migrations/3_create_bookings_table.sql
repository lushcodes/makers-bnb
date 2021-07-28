CREATE TABLE bookings (booking_id SERIAL PRIMARY KEY, 
name VARCHAR(64), 
description VARCHAR(500), 
price VARCHAR(8),
booking_user_id INTEGER,
CONSTRAINT fk_booking_user
  FOREIGN KEY(booking_user_id) 
	REFERENCES users(user_id)
	ON DELETE SET NULL
);