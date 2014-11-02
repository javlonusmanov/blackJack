//
//  Player.swift
//  BlackJackRevision
//
//  Created by Javlon Usmanov on 10/7/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import Foundation
class Player : Person {
    var bet:Double = 0.0
    var stand:Bool = false
    
    //constuctor
    override init (name:String = "Player") {
        super.init(name: name)
    }
    
    //changing the value for stand attribute
    var setStand:Bool {
        get {return self.stand}
        set(newBoolValue) { self.stand = newBoolValue}
    }
    
}