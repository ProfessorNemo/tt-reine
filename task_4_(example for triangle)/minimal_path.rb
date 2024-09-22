# Дан треугольник. Найдите минимальный путь от вершины до основания. На каждом
# шаге вы можете двигаться только на соседние цифры, находящиеся в ряду ниже.
# Пример:
# [
#     [​2​],
#    [​3​,4],
#   [6,​5​,7],
#  [4,​1​,8,3]
# ]
# Здесь длина минимального пути от вершины до основания равна 11 (т.к 2+3+5+1 = 11).

array = [[2],
         [3, 4],
         [6, 5, 7],
         [4, 1, 8, 3]]

def minimum_dist(triangle)
  return 0 if triangle.empty?

  (1...triangle.size).each do |row|
    prev = row - 1
    (0...triangle[row].size).each do |cell|
      tmp = []
      tmp.push triangle[prev][cell] if cell < triangle[prev].size
      tmp.push triangle[prev][cell - 1] if cell - 1 >= 0
      triangle[row][cell] += tmp.min
    end
  end

  triangle.last.min
end

puts minimum_dist(array)
