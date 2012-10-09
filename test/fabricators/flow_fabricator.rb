Fabricator(:flow) do
  description   { Faker::Lorem.sentence }
  amount        { 100.0 * rand }
  earn          { [true, false].sample }
end
