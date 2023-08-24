#dxruby  画面表示
require 'dxruby'
Window.bgcolor = C_WHITE
@img_color = C_BLUE
@img_waku = C_BLACK
color_number = [C_BLUE,C_GREEN,C_RED,C_WHITE]#色の配列
@map_hairetu = []
@z = 0
@a = 100
@b = 0
@x = 100
@y = 0
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
Window.loop do 
    if @img_waku == C_BLACK then #黒枠を表示するための処理
     if @z < 3 then #座標ｙ軸を下にする。
        @b += 100
     end 
     if @z == 3 then
        @a += 100
     end
     if @z < 6 && @z > 3 then#y軸を上にする。
        @b -= 100
     end
     if @z == 6  then#x軸を右にする。
        @a += 100
     end
     if @z < 9 && @z > 6 then#x軸を下にする
        @b += 100
     end
     if @z == 9 then#x軸を右にする
        @a += 100
     end
     if @z < 12 &&  @z > 9 then#y軸を上にする。
        @b -= 100
     end
     Sprite.new(@a,@b,Image.new(100,100,C_BLACK)).draw
    end    
    if @img_color != C_BLACK then #中の色を表示するための処理
        if @z < 3 then
            @y += 100
        end
        if @z  == 3 then
            @x += 100
        end
        if @z < 6 && @z > 3 then
            @y -= 100
        end
        if @z == 6  then
            @x += 100
        end
        if @z < 9 && @z > 6 then
            @y += 100
        end
        if @z == 9 then
            @x += 100
        end
    
        if @z < 12 && @z > 9 then   
            @y -= 100
        end
     test2 = Hose.new(@x,@y,Image.new(90,90,@img_color))
     test2.update
     @img_waku = C_BLACK#後で消す
     sleep(0.5)
     @H = @z
     @z += 1
     puts @z
     end
     if @z == 12 then
        @z = 0
        @a = 100
        @b = 0
        @x = 100
        @y = 0
    end
end