Name:  Ming Fu           ID:  47520516

## Proposed Project

I want to write a gobang elixir program.
It can be played by two people at the same time.
When five chess pieces of black or white are linked together into a straight line, the victory is judged.



## Outline Structure

the client of each player works as a single process that drawing the basic UI.
the server will use a single process to execute the game.
The server process will receive data from each player, process the data, and then send to the other player.
Also, there is a supervisor to manage those processes.




> replace all the ">" lines with your content, then push this to
> github and issue a merge request.
