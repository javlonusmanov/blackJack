//
//  Player.swift
//  BlackJackHomework
//
//  Created by Javlon Usmanov on 9/22/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import Foundation
class Player {
    var cards: [Card] = [];
    var money: Double = 100;
    var bet: Double = 1
    var betAmount: Double {
        get {
            return self.bet
        }
        set(newValue) {
            self.bet = newValue
        }
    }
    var maxAmount: Double {
        get {
            return self.money
        } set(newValue) {
            self.money -= newValue
        }
    }
    func handSum () -> (intScore: Int, strScore:String){
        var sum = 0
        for card in cards {
            if (card.hidden) {sum += 0}
            else {sum += card.rank.values.first}
        }
        return (sum, "\(sum)")
    }
    func showCards (){cards[0].hidden = false}
    func showHand() -> String{
        var sumLine = ""
        for card in cards {
            if (card.hidden) {
                sumLine += "Hidden Card \n"
            } else {
                sumLine += card.description
                sumLine += "\n"
            }
        }
        return sumLine
    }
    func hit (card:Card) {cards.append(card)}
    func stand () {handSum()}
    
    
    
}
