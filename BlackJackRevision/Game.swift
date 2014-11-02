//
//  Game.swift
//  BlackJackRevision
//
//  Created by Javlon Usmanov on 10/28/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import Foundation

class Game {
    init (deckSize:Int, playerNumber:Int) {
        shoe = Shoe(number: deckSize)
        for i in 0..<playerNumber {
            addPlayer()
        }
    }
    var shoe:Shoe
    var players:[Player] = []
    var dealer: Dealer = Dealer()
    var currentPlayer:Int = 0
    var currentDeck:Int = 0
    
    //adding new player to the game
    func addPlayer() {
        var newPlayer:Player = Player();
        players.append(newPlayer)
    }
    
    //gets a card from the Shoe and current deck
    func getCard(deckNdx:Int) -> Card? {
        return shoe.decks[deckNdx].drawCard()!
    }
    
    //calls the hit function for player at playerNdx index
    func hit (playerNdx:Int) {
       var card = getCard(currentDeck)
       players[playerNdx].addCard(card!)
    }
    
    //calls the stand function for player at playerNdx index
    func stand (playerNdx:Int) {
        players[playerNdx].setStand = true
    }
    

}
