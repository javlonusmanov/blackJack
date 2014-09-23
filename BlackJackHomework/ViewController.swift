//
//  ViewController.swift
//  BlackJackHomework
//
//  Created by Javlon Usmanov on 9/21/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var dealerScore: UILabel!
    @IBOutlet var playerScore: UILabel!
    @IBOutlet var betAmount: UITextField!
    @IBOutlet var dealerCards: UITextView!
    @IBOutlet var playerCards: UITextView!
    var game = BlackJackGame()
    var counter:Int = 0
    
    @IBOutlet var maxAmount: UILabel!
    @IBOutlet var gameOutcome: UILabel!
    func refresh () {
        dealerScore.text = String(game.dealer.handSum().strScore)
        playerScore.text = String(game.player.handSum().strScore)
        dealerCards.text = String(game.dealer.showHand())
        playerCards.text = String(game.player.showHand())
        gameOutcome.text = String(game.checkScore())
    }
    
    @IBAction func play(sender: UIButton) {
        if (counter == 5) {
            game.deck.shuffle()
        }
        else {
            counter++ }
        game.end()
        game.start()
        refresh()
        
        var bidAmount = betAmount.text.toInt()
        var money = maxAmount.text?.toInt()
        var temp = money! - bidAmount!
        maxAmount.text = String("$\(temp)")
        
        
    }
    
    @IBAction func hitButton(sender: UIButton) {
        game.hit(game.player)
        game.checkScore()
        refresh()
    }
    
    
    @IBAction func standButton(sender: UIButton) {
        var foo = game.stand(game.player)
        game.dealer.showCards()
        refresh()
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

