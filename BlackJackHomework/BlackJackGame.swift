//
//  BlackJackGame.swift
//  BlackJackHomework
//
//  Created by Javlon Usmanov on 9/22/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import Foundation
class BlackJackGame {
    var deck: Deck
    var player: Player
    var dealer: Player
    
    init () {
        self.player = Player()
        self.dealer = Player()
        self.deck = Deck()
    }
    
    func start () {
        deck.createDeck()
        drawCard(player)
        drawCard(dealer)
        drawCard(player)
        drawCard(dealer)
        dealer.cards[0].hidden = true
    }
    
    func drawCard(who: Player){
        var randomNumberOne = Int(arc4random_uniform(UInt32(deck.cardDeck.count)))
        var cardOne = deck.cardDeck[randomNumberOne]
        deck.cardDeck.removeAtIndex(randomNumberOne)
        who.cards.append(cardOne)
    }
    
    func checkScore() -> String {
        if (player.handSum().intScore > 21) {
            dealer.showCards()
            dealer.showHand()
            return "Busted, House wins!"}
        if (dealer.handSum().intScore > 21) {return "You won!"}
        
        return ""
    }
    
    func hit (playerId:Player) {drawCard(playerId)}
    
    func stand (playerId:Player) -> String {
        playerId.stand()
        var dealerTrueScore: Int = dealer.handSum().intScore + dealer.cards[0].rank.toRaw()
        if(dealerTrueScore == 21) {
            if( playerId.handSum().intScore != 21 ) {
                return "Busted, House wins!" }
        }
        while(dealer.handSum().intScore < 16) {
            drawCard(dealer)
            if dealer.handSum().intScore > 21 {break}
            
        }
        if (dealer.handSum().intScore > player.handSum().intScore) {
            return "House won!"
        } else {
            return "You won!"
        }
        
    }
    func end () {
        deck.cardDeck.removeAll(keepCapacity: true)
        player.cards.removeAll(keepCapacity: true)
        dealer.cards.removeAll(keepCapacity: true)
    }
}
