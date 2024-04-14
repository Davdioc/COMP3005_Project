-- Insert sample data into the Member table
INSERT INTO Member (first_name, last_name, email, password, phone, register_date)
VALUES
('John', 'Doe', 'john.doe@example.com', 'pass1234', '555-0101', '2023-04-01'),
('Jane', 'Smith', 'jane.smith@example.com', 'pass5678', '555-0102', '2023-04-02');

-- Insert sample data into the Trainer table
INSERT INTO Trainer (first_name, last_name, email, password)
VALUES
('Jim', 'Beam', 'jim.beam@example.com', 'secure123'),
('Jack', 'Daniels', 'jack.daniels@example.com', 'secure456');

-- Insert sample data into the Admin table
INSERT INTO Admin (first_name, last_name, email, password)
VALUES
('Admin', 'User', 'admin.user@example.com', 'adminpass');

-- Insert sample data into the FitnessGoal table
INSERT INTO FitnessGoal (m_id, goal, goal_date)
VALUES
(1, 'Lose 10 pounds', '2023-06-01'),
(2, 'Run 5k', '2023-07-01');

-- Insert sample data into the Room table
INSERT INTO Room (room_name)
VALUES
('Room A'),
('Room B');

-- Insert sample data into the Schedule table
INSERT INTO Schedule (t_id, m_id, r_id, available_date, workout_time)
VALUES
(1, 1, 1, '2023-04-15', '09:00-10:00'),
(2, 2, 2, '2023-04-16', '10:00-11:00');

-- Insert sample data into the Bill table
INSERT INTO Bill (m_id, amount, fee_type, payment_date)
VALUES
(1, 150.00, 'Monthly Fee', '2023-04-01'),
(2, 200.00, 'Annual Fee', '2023-04-02');