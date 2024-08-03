user = User.create!(
  email: 'user1@example.com',
  password: 'password123',
  password_confirmation: 'password123'
)

# Create events with required attributes
Event.create!(
  title: 'Sample Event',  # Use `title` instead of `name`
  start_date: '2024-08-10 10:00:00',
  end_date: '2024-08-10 11:00:00',
  description: 'A sample event for testing.',  # Ensure these attributes are in your schema
  location: 'Conference Room A',              # Ensure these attributes are in your schema
  user_id: user.id
)

# Create additional events
Event.create!(
  title: 'Sample Event 1',
  start_date: '2024-08-10 10:00:00',
  end_date: '2024-08-10 11:00:00'
)

Event.create!(
  title: 'Sample Event 2',
  start_date: '2024-08-11 10:00:00',
  end_date: '2024-08-11 11:00:00'
)

puts "Seeds successfully created!"
