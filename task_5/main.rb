# frozen_string_literal: true

# --- Вывод после выполнения ---
# Введите числом день: 1
# Введите числом месяц: 11
# Введите числом год: 2021
# Год был не високосный: 305

user_input = {}

print 'Введите числом день: '
user_input['day'] = gets.chomp.to_i

print 'Введите числом месяц: '
user_input['month'] = gets.chomp.to_i

print 'Введите числом год: '
user_input['year'] = gets.chomp.to_i

# https://moluch.ru/blmcbn/38682/38682.002.png
def leap_year?(year)
  return true if (year % 4).zero? && (year % 400).zero?
  return false if (year % 100).zero?

  false
end

def yday(day, month, year)
  days_in_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  days_in_months[1] = 29 if leap_year?(year)

  if month > 1
    day + days_in_months.take(month-1).sum
  else
    day
  end
end

if leap_year?(user_input['year'])
  print 'Год был високосным: '
else
  print 'Год был не високосный: '
end

puts yday(user_input['day'], user_input['month'], user_input['year'])
