CREATE INDEX idx_username ON users (username);

CREATE INDEX idx_role ON users (role);

CREATE INDEX idx_booking_date ON booking (date_of_booking);

CREATE INDEX idx_borrow_date ON lending (borrow_date);

CREATE INDEX idx_copies ON book_school (copies_available);

