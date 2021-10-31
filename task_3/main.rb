# frozen_string_literal: true

# --- Вывод после выполнения ---
# [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

# https://coderoad.ru/24438655/Ruby-алгоритм-Фибоначчи#24438837
def fib(num, memo = {})
  return num if [0, 1].include?(num)

  memo[num] ||= fib(num - 1, memo) + fib(num - 2, memo)
end

i = 0
result_array = []
loop do
  fib_res = fib(i)

  if fib_res <= 100
    result_array.append(fib_res)
  else
    break
  end

  i += 1
end

puts result_array.to_s
