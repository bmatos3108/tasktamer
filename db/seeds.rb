# Clear existing records
User.destroy_all
Grocery.destroy_all
Event.destroy_all

# Create users with required attributes
user = User.create!(
  email: 'user1@example.com',
  password: 'password123',
  password_confirmation: 'password123',
  name: 'Niklas Hermann'
)

# Create grocery items with all required attributes
Grocery.create!(name: 'Milk', quantity: 2, category: 'Dairy')
Grocery.create!(name: 'Eggs', quantity: 12, category: 'Dairy')
Grocery.create!(name: 'Bread', quantity: 1, category: 'Bakery')
Grocery.create!(name: 'Apples', quantity: 6, category: 'Fruits')
Grocery.create!(name: 'Tomatoes', quantity: 8, category: 'Vegetables')
Grocery.create!(name: 'Chicken Breast', quantity: 3, category: 'Meat')
Grocery.create!(name: 'Rice', quantity: 1, category: 'Grains')
Grocery.create!(name: 'Pasta', quantity: 2, category: 'Grains')
Grocery.create!(name: 'Orange Juice', quantity: 1, category: 'Beverages')
Grocery.create!(name: 'Cheese', quantity: 1, category: 'Dairy')

# Create events without `description` and `user_id`
Event.create!(
  title: 'Sample Event',
  start_date: '2024-08-10 10:00:00',
  end_date: '2024-08-10 11:00:00'
)

# Additional events
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
