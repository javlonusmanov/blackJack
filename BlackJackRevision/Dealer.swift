//
//  Dealer.swift
//  BlackJackRevision
//
//  Created by Javlon Usmanov on 10/7/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import Foundation
class Dealer : Person {
    
    //constructor
    override init (name:String = "Dealer") {
        super.init(name: name)
    }
    
    //this is a dealer specific function, unhiding cards dealer has
    func unhide() {
        for ndx in 0..<cards.count{
            if (cards[ndx]!.hidden) {
                cards[ndx]!.hidden = false
            }
        }
    }
}