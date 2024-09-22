require 'csv'
require_relative 'transaction'

module Algorithm
  class TransactionSorter
    def self.sort_transactions(input_file, output_file)

      # Используется ленивая загрузка для чтения файла по частям, не загружая весь файл в память
      Enumerator.new do |y|
        File.foreach(input_file) do |line|
          y << line
        end
      end.lazy.map do |line|

        # Cопоставляется каждая строка с объектом Transaction, разбирая строку на составные части
        timestamp, transaction_id, user_id, amount = line.chomp.split(',')
        Transaction.new(timestamp, transaction_id, user_id, amount)
      end.sort_by(&:amount).reverse_each do |transaction|

        # Запись отсортированных транзакций в файл по частям, не загружая весь набор данных в память
        CSV.open(output_file, 'a') do |csv|
          csv << [transaction.timestamp, transaction.transaction_id, transaction.user_id, transaction.amount]
        end
      end
    end
  end
end

