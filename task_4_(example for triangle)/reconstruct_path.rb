module ReconstructPath
  def reconstruct_path(tail, came_from)
    path = []

    until tail.nil?
      path << tail
      tail = came_from[tail]
    end

    path.reverse
  end
end
