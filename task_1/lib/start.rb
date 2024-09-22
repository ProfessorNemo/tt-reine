require_relative 'main'

file_path = '../data/transactions.txt'
output_file_path = '../data/sorted_transactions.txt'
File.delete(output_file_path) if File.exist?(output_file_path)
Algorithm::TransactionSorter.sort_transactions(file_path, output_file_path)

puts "\t\ntransactions:\n\n"
File.foreach(file_path) do |line|
  puts line
end

puts "\t\nsorted_transactions:\n\n"
File.foreach(output_file_path) do |line|
  puts line
end
