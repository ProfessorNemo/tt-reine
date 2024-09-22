# Дан треугольник. Найдите минимальный путь от вершины до основания.
# [
#     [​2​],
#    [​3​,4],
#   [6,​5​,7],
#  [4,​1​,8,3]
# ]

require_relative 'reconstruct_path'
require_relative 'bfs'

# Для поиска кратчайшего пути между вершиной и основанием треугольника
# (исп. граф поиска в ширину). Значения в узлах A-B-C-D-F-G-H-I-J
array = [[2],
         [3, 4],
         [6, 5, 7],
         [4, 1, 8, 3]]

# числовые значения - некие условные координаты
# [
#     [A​],
#    [B​,C],
#   [D,E​,F],
#  [G,H​,I,J]
# ]

graph = {
  'A' => %w[B C],
  'B' => %w[D E],
  'C' => %w[E F],
  'D' => %w[G H],
  'E' => %w[H I],
  'F' => %w[I J],
  'G' => [],
  'H' => [],
  'I' => [],
  'J' => []
}

# оптимальные маршруты от вершины до каждой точки основания треугольника
ag = Bfs.bfs(graph, 'A', 'G') # => ["A", "B", "D", "G"]
ah = Bfs.bfs(graph, 'A', 'H') # => ["A", "B", "D", "H"]
ai = Bfs.bfs(graph, 'A', 'I') # => ["A", "B", "E", "I"]
aj = Bfs.bfs(graph, 'A', 'J') # => ["A", "C", "F", "J"]

hash_letter_num = array.flatten.each_with_index.each_with_object({}) do |(node, i), result|
  node_char = ('A'.ord + i).chr # получаем букву для узла
  result[node_char] = node
  # result = {"A" => 2, "B" => 3, ....}
  # puts "#{node_char}. #{node}"
end

# маршруты
routes = [ag, ah, ai, aj]

# пути до основания
res = [
  ag.map { |i| hash_letter_num[i] }.sum,
  ah.map { |i| hash_letter_num[i] }.sum,
  ai.map { |i| hash_letter_num[i] }.sum,
  aj.map { |i| hash_letter_num[i] }.sum
]

puts 'кратчайший маршрут от вершины до основания:'
puts "#{res.min}: #{routes[res.find_index(res.min)]}"
