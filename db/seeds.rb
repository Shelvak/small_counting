user =User.new(
  name: 'Admin',
  lastname: 'Admin',
  email: 'admin@small_counting.com',
  password: '123456',
  password_confirmation: '123456',
  role: :admin
)

puts user.save ? 'User Ok' : user.errors.full_messages

flows_count = FlowsCount.new(
  in: 0.0,
  out: 0.0,
  total: 0.0
)

puts flows_count.save ? 'Flowscount OK' : flows_count.errors.full_messages
