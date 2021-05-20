#じゃんけんの処理
def janken
 puts "じゃんけん..."
 puts "0(グー)1(チョキ)2(パー)3(戦わない)"
 @choices = ["ぐー", "ちょき", "ぱー"]
 @player_hand = gets.to_i
 #randとは（）の中で１〜３からランダムで数字を出してくれる
 @enemy_hand = rand(3)
 puts "-----------------------"
 #相手と自分の出した手を表示してくれる。
 puts "自分：#{@choices[@player_hand]}"
 puts "相手：#{@choices[@enemy_hand]}"

 # 選択肢以外を選択した場合は予めループするようにする
 if @player_hand > 3
 puts "0~3の中で選択してください"
 puts "-----------------------"
 #falseに指定することによってもう一度最初から。trueに設定するとまた続きから。
 return false
 end

#3の時は終了。
 if @player_hand == 3
 puts "じゃんけんを終了します"
 #falseに指定することによってもう一度最初から。trueに設定するとまた続きから。
 return false
 
 #それ以外。（あいこの場合）
 elsif (@player_hand == @enemy_hand)
 puts "あいこで..."
 #trueに設定してまた続きから。
 return true
 #それ以外。（勝つ時と負ける時の条件式）
 elsif (@player_hand == 0 && @enemy_hand ==2) ||(@player_hand == 1 && @enemy_hand ==0) ||(@player_hand == 2 && @enemy_hand ==1)
 puts "負けました"
 janken_lose
 else 
 puts "勝ちました!"
 janken_win
 end
 return true
end

#ここからあっち向いてホイの処理。
def direction
 directions = ["上", "下", "左", "右"]
 puts "-----------------------"
 puts "あっちむいて〜"
 puts "0(上) 1(下) 2(左) 3(右)"
 @my_direction = gets.chomp.to_i
 @enemy_direction = rand(4)
 puts "ホイ!"
 puts "-----------------------"
 puts "自分:#{directions[@my_direction]}"
 puts "相手:#{directions[@enemy_direction]}"
end
 
 #じゃんけんをして負けた時。
def janken_lose
 #directionを追加することで、あっち向いてホイを開始する。無いとじゃんけんだけで終了。
 direction
 #相手の方向と一緒になった時は負け。
 if (@my_direction == @enemy_direction)
  puts "負けました"
  #「exit」負けた時に終了させる。
 exit
 #それ以外（勝敗がつかない時）はもう一度じゃんけんから再開。
 else
  puts "もう1回！"
  return true
 end
end
 
#じゃんけんをして勝った時。
def janken_win
 direction
 #相手の方向と一緒になっ時は勝ち。
 if (@my_direction == @enemy_direction)
  puts "勝ちました!"
  #「exit」勝った時終了させる。
  exit
 else
  puts "もう1回"
  return true
 end
end

# janken
next_game = true

#回数が決まってない時にはホワイルを使う。
while next_game do
 next_game = janken
end