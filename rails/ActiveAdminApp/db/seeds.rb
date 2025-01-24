# Create initial admin user
AdminUser.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
) if Rails.env.development?

# Create sample schools
school1 = School.create!(name: 'First School')
school2 = School.create!(name: 'Second School')

# Create sample classes
class1 = SchoolClass.create!(name: 'Class A', school: school1)
class2 = SchoolClass.create!(name: 'Class B', school: school2)

# Create sample students
Student.create!(name: 'John Doe', school_class: class1)
Student.create!(name: 'Jane Smith', school_class: class2)
