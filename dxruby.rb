#dxruby  画面表示
require 'dxruby'
Window.bgcolor = C_WHITE
img_waku = C_BLACK
z = 0
a = 0
b = 0
x = 0
y = 0
color_number = [C_BLUE,C_GREEN,C_RED,C_WHITE]#色の配列
class Waku #黒枠を配置するための処理
    def initialize(a,b)
        @a = a
        @b = b
    end
    def update()
        Window.draw(@a,@b,Image.new(100,100,C_BLACK))
    end
end

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
for num in 0..11 do
    puts num
    if img_waku == C_BLACK then #黒枠を表示するための処理

     if z == 0 then#ｘ軸を右にする。
        @a += 100
     end
     if z < 2 then #座標ｙ軸を下にする。
        @b -= 100

     end 
     if z < 5 && z > 2  then#y軸を上にする。
        @b += 100

     end
     if z == 5  then#x軸を右にする。
        @a += 100
     
     end
     if z < 8 && z > 5 then#x軸を下にする
        @b -= 100
     
     end
     if z == 8 then#x軸を右にする
        @a += 100
    
     end

     if z < 11 && z>8 then#y軸を上にする。
        @b += 100
     
     end
   
     test1 = Waku.new(@a,@b)
     test1.update
     img_waku = C_WHITE#後で消す
     color_number[rand(0..3)]#後で消す
     @img_color = color_number[]
     z += 1 
    end    
    if @img_color != C_BLACK then #中の色を表示するための処理
        if z < 2 then
            @b -= 100
        end
    
        if z  == 2 then
            @a += 100
        end
    
        if z  < 5 && z > 2 then
            @a += 100
        end
    
        if z == 5  then
            @a += 100
        end
    
        if z < 8  && z > 5 then
            @b -= 100
        end
    
        if z == 8 then
            @a += 100
        end
    
        if z < 11 && z > 8 then   
            @a += 100
        end
    test2 = Hose.new(@x,@y,Image.new(90,90,@img_color))
    test2.update
    img_waku = C_BLACK#後で消す
    end
end
end