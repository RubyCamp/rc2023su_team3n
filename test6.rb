require 'set'
require 'dxruby'

class ColorSensorData
  attr_reader :map

  def initialize(rows, cols)
    @map = Array.new(rows) { Array.new(cols, nil) }
  end

  def set_color(row, col, color)
    @map[row][col] = color
  end
end

class Dijkstra
  def initialize(map)
    @map = map
  end

  def shortest_path(start, goal)
    distances = Hash.new(Float::INFINITY)
    distances[start] = 0
    previous = {}

    queue = Set.new
    queue.add(start)

    while !queue.empty?
      current_node = queue.min_by { |node| distances[node] }
      queue.delete(current_node)

      neighbors(current_node).each do |neighbor|
        distance = distances[current_node] + 1  # 距離は全て1と仮定
        if distance < distances[neighbor]
          distances[neighbor] = distance
          previous[neighbor] = current_node
          queue.add(neighbor)
        end
      end
    end

    path = []
    current_node = goal
    while current_node
      path.unshift(current_node)
      current_node = previous[current_node]
    end

    path
  end

  private

  def neighbors(node)
    row, col = node
    neighbors = []

    if row > 0 && @map[row - 1][col] != 'B'
      neighbors << [row - 1, col]
    end
    if row < @map.size - 1 && @map[row + 1][col] != 'B'
      neighbors << [row + 1, col]
    end
    if col > 0 && @map[row][col - 1] != 'B'
      neighbors << [row, col - 1]
    end
    if col < @map[0].size - 1 && @map[row][col + 1] != 'B'
      neighbors << [row, col + 1]
    end

    neighbors
  end
end

# マップの作成とカラーセンサーデータの設定
color_data = ColorSensorData.new(3, 4)
color_data.set_color(0, 0, 'W')
color_data.set_color(0, 1, 'W')
color_data.set_color(0, 2, 'W')
color_data.set_color(0, 3, 'W')
color_data.set_color(1, 0, 'W')
color_data.set_color(1, 1, 'B')
color_data.set_color(1, 2, 'B')
color_data.set_color(1, 3, 'W')
color_data.set_color(2, 0, 'W')
color_data.set_color(2, 1, 'W')
color_data.set_color(2, 2, 'R')
color_data.set_color(2, 3, 'W')

# ダイクストラ法で最短経路を計算
start_node = [0, 0]
goal_node = [2, 2]
dijkstra = Dijkstra.new(color_data.map)
shortest_path_to_goal = dijkstra.shortest_path(start_node, goal_node)

# 赤のマスを探す
red_node = nil
color_data.map.each_with_index do |row, y|
  row.each_with_index do |cell, x|
    if cell == 'R'
      red_node = [y, x]
      break
    end
  end
  break if red_node
end

# 赤までの最短経路を計算
shortest_path_to_red = dijkstra.shortest_path(start_node, red_node)

# ウィンドウの初期化
Window.width = 400
Window.height = 300

Window.loop do
  # マップの描画
  color_data.map.each_with_index do |row, y|
    row.each_with_index do |cell, x|
      case cell
      when 'W'
        Window.draw(x * 50, y * 50, Image.new(50, 50, [255, 255, 255]))
      when 'B'
        Window.draw(x * 50, y * 50, Image.new(50, 50, [0, 0, 255]))
      when 'R'
        Window.draw(x * 50, y * 50, Image.new(50, 50, [255, 0, 0]))
      end
    end
  end

  # 最短経路の描画（ゴールまで）
  shortest_path_to_goal.each do |node|
    x, y = node
    Window.draw(x * 50, y * 50, Image.new(50, 50, [0, 255, 0, 128]))
  end

  # 最短経路の描画（赤まで）
  shortest_path_to_red.each do |node|
    x, y = node
    Window.draw(x * 50, y * 50, Image.new(50, 50, [255, 255, 0, 128]))
  end

  # 最短経路を線で描画（ゴールまで）
  if shortest_path_to_goal.size > 1
    shortest_path_to_goal.each_cons(2) do |node1, node2|
      x1, y1 = node1
      x2, y2 = node2
      if color_data.map[y1][x1] != 'B' && color_data.map[y2][x2] != 'B'
        Window.draw_line(x1 * 50 + 25, y1 * 50 + 25, x2 * 50 + 25, y2 * 50 + 25, [0, 255, 0])
      end
    end
  end

  # 最短経路を線で描画（赤まで）
  if shortest_path_to_red.size > 1
    shortest_path_to_red.each_cons(2) do |node1, node2|
      x1, y1 = node1
      x2, y2 = node2
      if color_data.map[y1][x1] != 'B' && color_data.map[y2][x2] != 'B'
        Window.draw_line(x1 * 50 + 25, y1 * 50 + 25, x2 * 50 + 25, y2 * 50 + 25, [255, 255, 0])
      end
    end
  end

  break if Input.key_push?(K_ESCAPE)
end