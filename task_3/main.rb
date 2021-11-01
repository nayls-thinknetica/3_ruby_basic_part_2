# frozen_string_literal: true

# --- Вывод после выполнения ---
# [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

fib_numbers = [0, 1]
while (new_number = fib_numbers.last(2).sum) <= 100 do
  fib_numbers << new_number
end

puts fib_numbers.to_s
