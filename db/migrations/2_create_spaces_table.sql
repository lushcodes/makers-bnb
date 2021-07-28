CREATE TABLE spaces (space_id SERIAL PRIMARY KEY, 
name VARCHAR(60), 
description VARCHAR(500), 
price VARCHAR(60), 
availability VARCHAR(60),
owner_user_id INTEGER, 
CONSTRAINT fk_owner
  FOREIGN KEY(owner_user_id) 
	REFERENCES users(user_id)
	ON DELETE CASCADE
);