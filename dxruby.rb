#dxruby  画面表示
require 'dxruby'
Window.bgcolor = C_WHITE
img_waku  = Image.new(100,100,C_BLACK)
img_red   = Image.new(90,90,C_BLUE)
img_green = Image.new(90,90,C_GREEN)
img_white = Image.new(90,90,C_WHITE)
img_blue  = Image.new(90,90,C_BLUE)
map_color    #外枠に入った時の変数
map_status   #送られてきたマップの色を使用するための変数

class Hose #インスタンス変数の初期化や設定などを行う
    def initialize(x,y,img_color)
        @x = x
        @y = y
        @img_color = img_color
    end
    def update #座標と色のアップデート
        Window.draw(@x,@y,Image.new(100,100,C_BLACK))
        Window.draw(@x+5,@y+5,@img_color)
    end
end
Window.loop do #画像を表示するための処理
if map_color == C_BLACK #黒のラインに入ったときにマップを生成
    @img_color = map_status
    test = Hose.new(100,100,Image.new(90,90,@img_color))
test.update
end
