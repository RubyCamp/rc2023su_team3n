#dxruby  画面表示
require 'dxruby'
Window.bgcolor = C_WHITE
@img_color = C_BLACK
img_waku = C_BLACK
color_number = [C_BLACK,C_BLUE,C_GREEN,C_RED,C_WHITE]#色の配列
class Hose #インスタンス変数の初期化や設定などを行う
    def initialize(x,y,img_color)
        @x = x
        @y = y
        @img_color = img_color   #黒枠の中の色を確かめるための変数
    end
    def update() #座標と色のアップデート
        Window.draw(@x+5,@y+5,@img_color)
    end
end
class Waku 
    def initialize(a,b)
        @a = a
        @b = b
    end
    def update()
        Window.draw(@a,@b,Image.new(100,100,C_BLACK))
    end
end
Window.loop do
    if img_waku == C_BLACK then #黒枠を表示するための処理
    test1 = Waku.new(100,100)
    test1.update
end    
if @img_color != C_BLACK then #中の色を表示するための処理
    test2 = Hose.new(100,100,Image.new(90,90,@img_color))
    test2.update
end
end