require 'ev3dev'
# カラーセンサーを設定
color_sensor = EV3DEV::ColorSensor.new(EV3DEV::INPUT_1)

# 色情報と対応する番号を定義
COLOR_MAPPING = {
  EV3DEV::ColorSensor::COLOR_BLACK => 1,
  EV3DEV::ColorSensor::COLOR_BLUE  => 2,
  EV3DEV::ColorSensor::COLOR_GREEN => 3,
  EV3DEV::ColorSensor::COLOR_RED   => 5,
  EV3DEV::ColorSensor::COLOR_WHITE => 6,
}

# 色情報を取得
color_id = color_sensor.color

# 色情報に対応する番号を取得
color_number = COLOR_MAPPING[color_id]
class SensorData
    def initialize(rows, cols)
      @rows = rows
      @cols = cols
      @data = Array.new(@rows) { Array.new(@cols, 0) }
    end
  
    def set_data(row, col, value)
      @data[row][col] = value
    end
  
    def get_data(row, col)
      @data[row][col]
    end
  
    def display_data
      @data.each do |row|
        puts row.join(" ")
      end
    end
  end
end
color_data = ColorSensorData.new(3, 4)
Window.loop
if color_number == 1 then
    color_status = 1
end

if color_number == 2
    color_status = 2
end

if clor_number == 3
    color_status = 3
end    

if color_number == 5
    color_status = 5
end    

if color_number == 6
    color_status = 6
end  

if color 