class DiceController < ApplicationController #Inheritance for all controllers

	def play_game
		render "intro" #goes to Welcome Start Game page views/dice/intro.html.erb
		puts "intro"
		return
	end
	
	def roll_the_dice # created the two dice and 'rolls' them to pick one side of each
		dice1 = ['1', '2', '3', '4', '5', '6']
		dice2 = ['1', '2', '3', '4', '5', '6']
		
		@d1 = dice1.sample(1)
		@d2 = dice2.sample(1)
	end
	
	def start_game
	
		roll_the_dice # rolls the dice
		
		@sum = @d1.first.to_i + @d2.first.to_i # sets total sum
		
		if  @sum == 7 or @sum == 11 # initial win condition
			render "win"
			puts "roll 1 win"
			return
		end
		
		if  @sum == 2 or @sum == 3 or @sum == 12 # initial lose condition
			render "lose"
			puts "roll 1 lose"
			return
		else # goal is set, roll again
			render "rollagain"
			puts "roll 1 rollagain"
			return
		end
	end
	
	
	def re_roll
	
		roll_the_dice # roll the dice
		
		@sum = params[:sum] # gets goal sum from params
		
		@sum2 = @d1.first.to_i + @d2.first.to_i # calculate roll sum
		
		if  @sum2 == 7  # lose condition
			render "lose"
			puts "roll # lose"
			return
		end
		
		if  @sum.to_i == @sum2 # roll matches goal, win condition
			render "win"
			puts "roll # win"
			return
		else # re-roll condition
			render "rollagain"
			puts "roll # rollagain"
			return
		end
	end
end
