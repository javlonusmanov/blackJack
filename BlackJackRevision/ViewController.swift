//
//  ViewController.swift
//  BlackJackRevision
//
//  Created by Javlon Usmanov on 10/7/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController {
    var numDecks:Int!
    var numPlayers:Int!
    var blackjack:Game!
    var plOneImages:[UIImageView] = []
    var plTwoImages:[UIImageView] = []
    var plThreeImages:[UIImageView] = []
    var plFourImages:[UIImageView] = []
    var dealerImages:[UIImageView] = []
    var plImages:[[UIImageView]] = []
    
    //player1 cards UIImages
    @IBOutlet weak var plOneImageOne: UIImageView!
    @IBOutlet weak var plOneImageTwo: UIImageView!
    @IBOutlet weak var plOneImageThree: UIImageView!
    @IBOutlet weak var plOneImageFour: UIImageView!
    @IBOutlet weak var plOneImageFive: UIImageView!
    
    
    //player2 cards UIImages
    @IBOutlet weak var plTwoImageOne: UIImageView!
    @IBOutlet weak var plTwoImageTwo: UIImageView!
    @IBOutlet weak var plTwoImageThree: UIImageView!
    @IBOutlet weak var plTwoImageFour: UIImageView!
    @IBOutlet weak var plTwoImageFive: UIImageView!
    
    //player3 cards UIImages
    @IBOutlet weak var plThreeImageOne: UIImageView!
    @IBOutlet weak var plThreeImageTwo: UIImageView!
    @IBOutlet weak var plThreeImageThree: UIImageView!
    @IBOutlet weak var plThreeImageFour: UIImageView!
    @IBOutlet weak var plThreeImageFive: UIImageView!
    
    //player4 cards UIImages
    @IBOutlet weak var plFourImageOne: UIImageView!
    @IBOutlet weak var plFourImageTwo: UIImageView!
    @IBOutlet weak var plFourImageThree: UIImageView!
    @IBOutlet weak var plFourImageFour: UIImageView!
    @IBOutlet weak var plFourImageFive: UIImageView!
    
    //dealer cards UIImages
    @IBOutlet weak var dealerImageOne: UIImageView!
    @IBOutlet weak var dealerImageTwo: UIImageView!
    @IBOutlet weak var dealerImageThree: UIImageView!
    @IBOutlet weak var dealerImageFour: UIImageView!
    @IBOutlet weak var dealerImageFive: UIImageView!
    
    
    
    
    //function will be called to get cards of each player and display them in each players UIImageView
    func getPlayerCards() {
        for i in 0..<blackjack.players.count {for x in 0..<blackjack.players[i].cards.count {plImages[i][x].image = blackjack.players[i].cards[x]?.image}}
        for i in 0..<blackjack.dealer.cards.count {dealerImages[i].image = blackjack.dealer.cards[i]?.image}
    }
    //start button clickListener
    @IBAction func startGame(sender: UIButton) {
        getPlayerCards()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        plOneImages += [plOneImageOne, plOneImageTwo, plOneImageThree, plOneImageFour, plOneImageFive]
        plTwoImages += [plTwoImageFive, plTwoImageFour, plTwoImageThree, plTwoImageTwo, plTwoImageOne]
        plThreeImages += [plThreeImageOne, plThreeImageTwo, plThreeImageThree, plThreeImageFour, plThreeImageFive]
        plFourImages += [plFourImageFive, plFourImageFour, plFourImageThree, plFourImageTwo, plFourImageOne]
        plImages += [plOneImages, plTwoImages, plThreeImages, plFourImages]
        dealerImages += [dealerImageOne, dealerImageTwo, dealerImageThree, dealerImageFour, dealerImageFive]
        blackjack = Game(deckSize: numDecks,playerNumber: numPlayers)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

