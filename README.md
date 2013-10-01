Tic Tac Toe
===========

A simple game to practice arrays, looping, classes and Ruby!

# INSTALL

* Fork your own copy of this exercise and clone it into your projects folder

```
    cd ~/projects
    git clone <your fork>
```

* Run with the following command, from the directory you just cloned into

```
ruby tic_tac_toe.rb
```

# TODO

Over to you. Work through the following improvements and see if you can figure
out how to achieve them. Each time you make a change, commit and push your code
to your GitHub account.

1. Start with the Board class. Implement the to_s method so that it returns a String
that would be suitable for use with puts, and display a 3x3 grid of the board. Update the play method on Game so that it displays the board.
2. Add code to the mark method so that the array value at a given x, y index combination is set to marker.
3. Add code to the play method on Game so that it prompts for a user input, stating the value of @turn, and asking for x, y co-ordinate. Pass this information to mark and re-draw the board.
4. Think about how we can determine each of the possible winning moves. Add code to the Board each_winning_move method to return all possible moves. How could we make this method an object-orientated iterator?
5. Implement the winner method on the Game class, so that it checks all the winning combinations with the current Player in @turn, to see if the positions are filled or not. Call this method from the play method to determine if the game is over or not.
6. Implement next_turn, so that play transfers from one player to the other, by flipping the class stored in the @turn variable.
7. Finish the implementation of play so that it loops continually until the game is over. How can we detect for a draw?
8. Make any refinements / refactoring that you see fit.
9. Convert your app to a shoes app without making major changes to your classes. You won't be using play anymore- what changes now need to be made?
10. See if you can beat your neighbour at tic tac toe!

As always, please send me a pull request when you are done.

# Homework

Using Shoes or a text-based terminal application, create a trip calculator.
Ask the user (politely) for four inputs:

* Distance – how far will you drive?
* MPG – what is the fuel efficiency of the car?
* £/PG – how much does petrol cost per gallon?
* Speed – how fast will you drive?

Your output is a string: “Your trip will take 3.5 hours and cost £255.33.”

For every 1 MPH over 60 MPH, reduce the the MPG by 2 MPG. (i.e. a car that
normally gets 30 mpg would only get 28 mpg if its speed were 61 mph. Handle the
case that this value gets below zero).

# Homework Extensions

Bonus points for creating another calculator or amending your calculator with
the following features:

* Mortgage calculator: Calculate the monthly payment when given the other variables as input.
* BMI: Calculate the BMI when given the height and weight.

# Submission

Once you're done, submit a pull request so that I can review your work.
