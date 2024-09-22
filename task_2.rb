# frozen_string_literal: true

# Дана строка s и словарь d, содержащий некие слова. Определите, можно ли
# строку s представить в последовательность разделенных пробелом слов,
# содержащихся в словаре d.

sample = 'двадесятка'
dict = %w[шестерка пятерка два восьмерка семерка десятка девятка]

def word_break(sample, dict)
  can_break?(sample, dict, {})
end

def can_break?(sample, dict, memo)
  return true if sample.empty?

  (0...sample.length).each do |index|
    string_to_pass = sample[index + 1...sample.length]

    memo[string_to_pass] ||= can_break?(string_to_pass, dict, memo)

    return true if dict.include?(sample[0..index]) && memo[string_to_pass]
  end

  false
end

puts word_break(sample, dict)

