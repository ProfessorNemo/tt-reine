describe Algorithm::TransactionSorter do
  let(:input_file) { 'spec/fixtures/input.txt' }
  let(:output_file) { 'spec/fixtures/output.txt' }

  it 'sorts transactions by amount in descending order' do
    File.write(input_file, <<~EOS
      2023-09-03T12:45:00Z,txn12345,user987,500.25
      2023-09-03T12:46:00Z,txn67890,user123,300.51
      2023-09-03T12:47:00Z,txn11111,user456,200.75
    EOS
    ) unless File.exist?(input_file)

    delete_output_file_if_exists(output_file)
    Algorithm::TransactionSorter.sort_transactions(input_file, output_file)

    expect(File.readlines(output_file).map(&:chomp)).to eq([
                                                             '2023-09-03T12:45:00Z,txn12345,user987,500.25',
                                                             '2023-09-03T12:46:00Z,txn67890,user123,300.51',
                                                             '2023-09-03T12:47:00Z,txn11111,user456,200.75'
                                                           ])

  end
end

def delete_output_file_if_exists(filename)
  File.delete(filename) if File.exist?(filename)
end

