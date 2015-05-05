# battleships
Makers Academy week 2 - Battleships game

A game that mimics the functionality of Battleships on the command line. Demonstrates OOD, TDD, BDD, and composition / inheritance.

## Initial Class Responsibility Collaborator

Class: Board

An instance of this class stores the state of an individual board, and has methods to interact with the board.

Interactions:

* Create the empty board
* Add a ship to the board
* Check if selected board locations are storing a ship
* Check if selected board location is within the board area

Note: seeing as we're doing this agile, we're taking the simplest possible model to begin with and implementing that, then adding complexity.

First implementation: As a player, so that I can prepare for the game, I would like to place a ship in a board location.

Second implementation: As a player, so that I can play a more interesting game, I would like to have a range of ship sizes to choose from.

Third implementation: As a player, so that I can create a layout of ships to fox my opponent, I would like to be able to choose the direction my ships face in.

Fourth implementation: As a player, so that I can have a coherent game, I would like ships to be constrained on the board.
