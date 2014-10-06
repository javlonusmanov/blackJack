//
//  BlackJackGame.swift
//  BlackJackHomework
//
//  Created by Javlon Usmanov on 9/22/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import Foundation
class BlackJackGame {
    var decks: [Deck] = []
    var players: [Person] = []
    var dealer = Dealer()
    
    //Initially based on number of decks and players enters, we create those decks and
    // and players
    func restart (numDecks: Int = 1, numPlayers:Int = 5) {
        decks.removeAll(keepCapacity: false)
        players.removeAll(keepCapacity: false)
        dealer.cards.removeAll()
        
        for i in 0..<numDecks {
            var tempDeck = Deck()
            tempDeck.createDeck()
            decks.append(tempDeck)
        };
        decks[0].current = true
        for i in 0..<numPlayers {
            var tempPlayer = Person()
            for ndx in 0..<2 {tempPlayer.hit(drawCard()!)}
            players.append(tempPlayer)
        }
        dealer.hit(drawCard()!)
        dealer.hit(drawCard()!)
        // dealer.cards[0].hidden = true
    }
    
    //giving a card to particular player
    func drawCard() -> Card?{
        for i in 0..<decks.count {
            if (decks[i].current && decks[i].cardDeck.count > 25) {
                var randomNumberOne = Int(arc4random_uniform(UInt32(decks[i].cardDeck.count)))
                if (decks[i].cardDeck.count > randomNumberOne) {
                    var aCard = decks[i].cardDeck[randomNumberOne]
                    decks[i].cardDeck.removeAtIndex(randomNumberOne)
                    return aCard
                }
                return nil
            }
            return nil
        }
        return nil
    }
    
    //individual game output for each player and if player is busted, that player
    //is removed from the players set and that player is out of the game
    func checkScore(player:Person) -> String {
        var dealerTrueScore: Int = dealer.handSum().intScore + dealer.cards[0].rank.toRaw()
        if (player.stood == true) {
            if (player.handSum().intScore > 21) {
                dealer.showCards()
                dealer.showHand()
                return "Busted, House wins!"
            }
            else if (dealer.handSum().intScore > 21) {return "You won!"}
//            if( player.handSum().intScore > 21 ) {
//                return "Busted, House wins!"
//            }
//            if (dealer.handSum().intScore > 21) {
//                return "You won!"
//            }
            else if (dealer.handSum().intScore > player.handSum().intScore) {return "House won!"}
            else {return "You won!"}
        }
        return ""
    }
    
    func selectPlayers(index: Int) -> Person {
        return players[index]
    }
    
    //hit funtions that takes in playerId and card(maybe)
    func hit (player:Person) {
        player.hit(drawCard()!)
    }
    
    func dealerHit () {
        while (dealer.handSum().intScore < 16) {
            dealer.hit(drawCard()!)
        }
        if (dealer.handSum().intScore > 16) {stand(dealer)}
        //dealer.showCards()
        //dealer.showHand()
    }
    
    
    func stand (player:Person){
        player.stand()
    }
}
