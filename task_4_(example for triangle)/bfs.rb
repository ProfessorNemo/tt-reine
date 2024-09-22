require_relative 'reconstruct_path'

module Bfs
  extend ReconstructPath

  def self.bfs(graph, start, goal)
    q = Queue.new
    q.enq(start)
    came_from = { start => nil }

    until q.empty?
      curr = q.deq

      next unless graph.key? curr
      return reconstruct_path(goal, came_from) if curr == goal

      graph[curr].each do |neighbor|
        unless came_from.key?(neighbor)
          came_from[neighbor] = curr
          q.enq(neighbor)
        end
      end
    end
  end
end
