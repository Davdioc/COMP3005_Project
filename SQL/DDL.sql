CREATE TABLE Member (
    m_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255)  NOT NULL,
    email VARCHAR(255)      UNIQUE NOT NULL,
	password VARCHAR(255)   NOT NULL,   
    phone VARCHAR(20),
    register_date DATE      DEFAULT CURRENT_DATE
);


CREATE TABLE Trainer (
    t_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,	
	password VARCHAR(255)   NOT NULL
);

CREATE TABLE Admin (
  a_id          SERIAL          PRIMARY KEY,
  first_name  VARCHAR(255)    NOT NULL,
  last_name   VARCHAR(255)    NOT NULL,
  email       VARCHAR(255)    UNIQUE NOT NULL,
  password    VARCHAR(255)    NOT NULL
);



CREATE TABLE FitnessGoal (
	fg_id SERIAL PRIMARY KEY,
	m_id INTEGER NOT NULL,
	goal VARCHAR(255) NOT NULL,
	goal_date DATE NOT NULL,
	FOREIGN KEY (m_id) 
   	 REFERENCES Member (m_id)
);

CREATE TABLE Room (
    r_id SERIAL PRIMARY KEY,
    room_name  VARCHAR(255) NOT NULL 
);

CREATE TABLE Schedule (
    s_id SERIAL PRIMARY KEY,
    t_id INT,
    m_id INT,
	r_id INT,
    available_date DATE DEFAULT CURRENT_DATE,
    workout_time VARCHAR(20),
	FOREIGN KEY (t_id) 
   	 REFERENCES Member (m_id),
    FOREIGN KEY (t_id) 
   	 REFERENCES Trainer (t_id),
	FOREIGN KEY (r_id) 
   	 REFERENCES Room (r_id)
    
);


CREATE TABLE Bill (
  id              SERIAL          PRIMARY KEY,
  m_id       INT,
  amount          NUMERIC(5, 2)   NOT NULL,
  fee_type        VARCHAR(255)    NOT NULL,
  payment_date    DATE,
  FOREIGN KEY (m_id) 
    REFERENCES Member (m_id)
);