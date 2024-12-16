CREATE TABLE Doctors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Clients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE TimeSlots (
    id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES Doctors(id),
    time TIME NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Appointments (
    id SERIAL PRIMARY KEY,
    time_start_id INT REFERENCES TimeSlots(id),
    time_end_id INT REFERENCES TimeSlots(id),
    client_id INT REFERENCES Clients(id),
    doctor_id INT REFERENCES Doctors(id),
    date DATE NOT NULL,
    status ENUM('confirmed', 'canceled', 'missed') DEFAULT 'confirmed',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_time_per_doctor UNIQUE (doctor_id, date, time_start_id, time_end_id)
);

CREATE TABLE MissedAppointments (
    id SERIAL PRIMARY KEY,
    appointment_id INT REFERENCES Appointments(id),
    reason TEXT,
    discount DECIMAL(5, 2) CHECK (discount >= 0 AND discount <= 100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE WorkHours (
    id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES Doctors(id),
    date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (start_time < end_time)
);
