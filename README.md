# Knight's Travails

This project uses a breadth-first graph search with backtracking to find the shortest path for the knight to travel between any two squares on a chessboard.

The user enters a starting square and a target square, which the program then analyses to find the shortest path.

My program's strategy is a simplified version of [Dijkstra's algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm) - simplified because the distance between any two neighbouring nodes on a Knight's chessboard is always one.

![Screenshot](https://archive.lib.msu.edu/crcmath/math/math/k/k_674.gif)

It's a project from [The Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms).

## Installation

Open your terminal/command line. Navigate to the directory where you want this project to live. Type:
```
$ git clone https://github.com/Jonosenior/knights_travails.git
$ cd knights_travails
$ ruby knights_travails.rb
```

## Structure

  * Starting at the starting square, the #graph_search_to function checks if the current square is the target, creates a vertex for it, and adds its neighbours to a to_visit queue. Each vertex contains just two data points: 1) the location of the square it represents, and 2) a pointer to the "parent" (ie, the vertex which is one level closer to the starting square). The starting square's parent defaults to nil. The function then iterates through each neighbour, checking it it's the target, adding their neighbours to a to_visit queue, and so on.

  * Once the target square is discovered, the #backtrack_from method follows the path backwards from target square until it reaches the starting square, using the #parent method for each vertex. Since breadth-first search is used, the first path to the target is automatically the shortest.


## Thoughts

  * Having created a working version of the basic graph search using randomly-assigned squares, I tried to allow the user to input squares. This proved much trickier than expected, because my code was tightly coupled. Realising this was probably an indicator of poorly-designed code, I decided to read Sandi Metz's Practical Object-Oriented Design in Ruby in order to get a better idea of what well-structured applications look like.

  * I tried to implement some of the principles in that book: reducing dependencies, increasing modularity and separating public and private methods in my code. I'm still not entirely confident that the code here displays best practice, but I'm moving on and hope to get someone more experienced to look over it soon. 
