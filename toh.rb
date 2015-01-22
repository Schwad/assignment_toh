class TowerOfHanoi
  def initialize(towerlength)
    @towerlength = towerlength
    @tower1 = (1..towerlength).to_a
    @tower2 = []
    @tower3 = []
    @move_count = 0
  end
  
  def move(num1,num2)
    num1 = num1.to_i
    num2 = num2.to_i
     if num1 == 1
       if num2 == 2
         piece = @tower1.pop
         @tower2 << piece  
       elsif num2 == 3
         piece = @tower1.pop
         @tower3 << piece
       end       
     elsif num1 == 2
       if num2 == 1
         piece = @tower2.pop
         @tower1 << piece  
       elsif num2 == 3
         piece = @tower2.pop
         @tower3 << piece
       end    
     elsif num1 == 3
       if num2 == 2
         piece = @tower3.pop
         @tower2 << piece  
       elsif num2 == 1
         piece = @tower3.pop
         @tower1 << piece
       end      
     end    
    @move_count += 1
  end
  
  def render
    puts "Current Board:\n\n"
    puts "Tower One: #{@tower1} \n"
    puts "Tower Two: #{@tower2} \n"
    puts "Tower Three: #{@tower3} \n"
  end
  
  def wins?
    if @tower2 == (1..@towerlength).to_a || @tower3 == (1..@towerlength).to_a
      puts "Congratulations!!! You have won Tower of Hanoi! It took you #{@move_count} moves to move a tower that was #{@towerlength} high!!!\n\n"
      exit
    end
  end
end

#def quits?  <--for bonus points fix quits
#
#end



#intro
sleepy = 0.75
puts "Welcome to Tower of Hanoi! You will specify how high your \n Tower will be, then input the tower you want to move the piece from \n and the number of the tower you want to move the piece to! It will then move the piece and \n prompt you for another move. If you want to exit any time just type \n 'quit' ; or the game will finish if you have all of the pieces iin order on \n another tower. Good luck!\n\n"
sleep sleepy
puts "How high would you like your tower? \n\n"
user_tower = gets.chomp.to_i
sleep sleepy
user_game = TowerOfHanoi.new(user_tower)
user_game.render
while true  
  puts "Which tower do you want to move from?"
  user_move1 = gets.chomp
  ##Need to get quits? method working
  if user_move1  == "quit"
    puts "Thanks for playing! See you around soon!"
    exit
  end
  sleep sleepy
  puts "Which tower do you want to move to?"
  user_move2 = gets.chomp  
  if user_move2  == "quit"
    puts "Thanks for playing! See you around soon!"
    exit
  end
  sleep sleepy
  user_game.move(user_move1,user_move2)
  user_game.render
  user_game.wins?  
end