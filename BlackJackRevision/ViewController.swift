//
//  ViewController.swift
//  BlackJackRevision
//
//  Created by Javlon Usmanov on 10/7/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var blackjack:Game = Game(deckSize: 2,playerNumber: 1)
    @IBOutlet var cardTest: UIImageView!
    var c:Int = 0
    var d:Int = 0
    
    @IBAction func buttonPress(sender: AnyObject) {
        if (c < 52) {
            cardTest.image = blackjack.shoe.decks[d].cards[c].image
            c = c + 1
        } else {
            d = d + 1
            c = 0
        }
    }
        

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

