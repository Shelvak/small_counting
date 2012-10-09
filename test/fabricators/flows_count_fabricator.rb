Fabricator(:flows_count) do |f_c|
  f_c.out { 100.0 * rand }
  f_c.in { 100.0 * rand }
  f_c.total { 100.0 * rand }
end
