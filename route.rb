# グラフの表現
graph = {
  [0, 0] => [[0, 1], [1, 0]],
  [0, 1] => [[0, 0], [0, 2], [1, 1]],
  [0, 2] => [[0, 1], [0, 3], [1, 2]],
  [0, 3] => [[0, 2], [1, 3]],
  [1, 0] => [[0, 0], [1, 1], [2, 0]],
  [1, 1] => [[0, 1], [1, 0], [1, 2], [2, 1]],
  [1, 2] => [[0, 2], [1, 1], [1, 3], [2, 2]],
  [1, 3] => [[0, 3], [1, 2], [2, 3]],
  [2, 0] => [[1, 0], [2, 1]],
  [2, 1] => [[1, 1], [2, 0], [2, 2]],
  [2, 2] => [[1, 2], [2, 1], [2, 3]],
  [2, 3] => [[1, 3], [2, 2]],
}
colors = []
class ColorSensorDate
  attr_reader :map
  def initialize(rows,cols)
    @map = Array.new(rows) {Array.new(cols)}
  end
  def set_color(row, col, color)
    @map[row][col] = color
  end
end

class Dijkstra
  def initialize(map)
    @map = map
  end
end

def dijkstra_with_obstacles(graph, obstacles, start, goal)
    distances = Hash.new(Float::INFINITY)  # 各ノードへの距離を無限大で初期化
    distances[start] = 0  # 始点の距離を0に設定
    previous = {}  # 最短経路を記録するためのハッシュ
  
    queue = Set.new
    queue.add(start)