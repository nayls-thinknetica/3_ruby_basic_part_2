# frozen_string_literal: true

# Так выглядит вся хешмапа
# {:test=>[{:cost=>1.0, :count=>2.0}, {:cost=>2.0, :count=>3.0}], :test2=>[{:cost=>3.0, :count=>4.0}]}

# --- Вывод после выполнения ---
# Купленные продукты:
# 1. test:
#         Цена товара без НДС     1.0     *2.0    =2.0
#         Цена товара с НДС 10%   1.1     *2.0    =2.2
# 2. test:
#         Цена товара без НДС     2.0     *3.0    =6.0
#         Цена товара с НДС 10%   2.2     *3.0    =6.6
# 3. test2:
#         Цена товара без НДС     3.0     *4.0    =12.0
#         Цена товара с НДС 10%   3.3     *4.0    =13.2
# -----------------------------------------------------
#                 ИТОГО К ОПЛАТЕ (без НДС)        =20.0
#                 ИТОГО К ОПЛАТЕ (с НДС)          =22.0

products = {}
loop do
  print 'Введите название товара:'
  name = gets.chomp.to_s
  break unless name != 'стоп' && name != 'stop'

  print 'Введите цену:'
  cost = gets.chomp.to_f
  print 'Введите количество:'
  count = gets.chomp.to_f

  if products.key?(name.to_sym)
    products[name.to_sym].append({ cost: cost, count: count })
  else
    products[name.to_sym] = [
      {
        cost: cost,
        count: count
      }
    ]
  end
end

# puts "DEBUG: Вывести всю хешмапу - #{products}"

puts 'Купленные продукты:'
product_iterator = 0
purchase_all_cost_sum = 0.0
purchase_all_cost_sum_with_nds = 0.0
products.each do |product, purchase_info|
  purchase_info.each do |purchase_info|
    product_iterator += 1
    puts "#{product_iterator}. #{product}:"

    purchase_cost_sum = purchase_info['cost'.to_sym] * purchase_info['count'.to_sym]
    puts "\tЦена товара без НДС\t#{purchase_info['cost'.to_sym]}\t*#{purchase_info['count'.to_sym]}\t=#{purchase_cost_sum.round(2)}"

    purchase_cost_with_nds = purchase_info['cost'.to_sym] + (purchase_info['cost'.to_sym] * 0.10)
    purchase_cost_sum_with_nds = purchase_cost_with_nds * purchase_info['count'.to_sym]
    puts "\tЦена товара с НДС 10%\t#{purchase_cost_with_nds}\t*#{purchase_info['count'.to_sym]}\t=#{purchase_cost_sum_with_nds.round(2)}"

    purchase_all_cost_sum += purchase_cost_sum
    purchase_all_cost_sum_with_nds += purchase_cost_sum_with_nds
  end
end

puts "-----------------------------------------------------"
puts "\t\tИТОГО К ОПЛАТЕ (без НДС)\t=#{purchase_all_cost_sum.round(2)}"
puts "\t\tИТОГО К ОПЛАТЕ (с НДС)  \t=#{purchase_all_cost_sum_with_nds.round(2)}"
