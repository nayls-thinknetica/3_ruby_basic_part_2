# frozen_string_literal: true

# --- Вывод после выполнения ---
# Введите числом день: 1
# Введите числом месяц: 11
# Введите числом год: 2021
# Год был не високосный: 305

user_input = Hash.new

print 'Введите числом день: '
user_input['day'] = Integer(gets.chomp)

print 'Введите числом месяц: '
user_input['month'] = Integer(gets.chomp)

print 'Введите числом год: '
user_input['year'] = Integer(gets.chomp)

# https://moluch.ru/blmcbn/38682/38682.002.png
def leap_year?(year)
  return true if (year % 4).zero? && (year % 400).zero?
  return false if (year % 100).zero?

  false
end

def yday(day, month, year)
  days_in_months = %w[31 28 31 30 31 30 31 31 30 31 30 31]

  day_number = 0
  (0..month.to_i - 2).each do |i|
    day_number += days_in_months[i].to_i
  end

  if leap_year?(year.to_i)
    day_number + day.to_i + 1
  else
    day_number + day.to_i
  end
end

if leap_year?(user_input['year'])
  print 'Год был високосным: '
else
  print 'Год был не високосный: '
end

puts yday(user_input['day'], user_input['month'], user_input['year'])
