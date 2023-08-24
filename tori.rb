 def dijkstra(graph, start)
  distances = {}
  previous = {}
  nodes = []

  graph.each do |node, value|
    distances[node] = Float::INFINITY
    previous[node] = nil
    nodes << node
  end

  distances[start] = 0

  while !nodes.empty?
    smallest = nodes.min_by { |node| distances[node] }
    nodes.delete(smallest)

    break if distances[smallest] == Float::INFINITY

    graph[smallest].each do |neighbor, weight|
      alt = distances[smallest] + weight
      if alt < distances[neighbor]
        distances[neighbor] = alt
        previous[neighbor] = smallest
      end
    end
  end

  previous
end

start_node = 'A'
previous_nodes = dijkstra(graph, start_node)

# 最短経路とそのコストを表示
graph.each_key do |node|
  path = []
  current_node = node
  while current_node
    path.unshift(current_node)
    current_node = previous_nodes[current_node]
  end
  path_str = path.join(' -> ')
  puts "Shortest path to #{node}: #{path_str}, Cost: #{distances[node]}"
end