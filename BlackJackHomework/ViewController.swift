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
    
    @IBOutlet var playerCards: UILabel!
    @IBOutlet var dealerCards: UILabel!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var maxAmount: UITextView!
    @IBOutlet var gameOutcome: UILabel!
    
    @IBOutlet var standButton: UIButton!
    @IBOutlet var hitButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet weak var playerLabel: UILabel!
    var game = BlackJackGame()
    
    var index: Int = 0
    var counter:Int = 0
    var moneyStart:Int = 100
    var currentPlayer:Person = Person ()
    func refresh () {
        if (index < game.players.count ) { currentPlayer = game.selectPlayers(index) }
        else {
            game.dealerHit()
            index = 0
            currentPlayer = game.players.first!
        }
        if (currentPlayer.stood) {
            nextButton.hidden = false
            hitButton.hidden = true
            standButton.hidden = true
        }
        playerLabel.text = String("Player \(index + 1) Score")
        dealerScore.text = String(game.dealer.handSum().strScore)
        playerScore.text = String(currentPlayer.handSum().strScore)
        dealerCards.text = String(game.dealer.showHand())
        playerCards.text = String(currentPlayer.showHand())
        gameOutcome.text = String(game.checkScore(currentPlayer))
        
        
    }
    
    @IBAction func nextButton(sender: UIButton) {
        refresh()
    }
    @IBAction func play(sender: UIButton) {
        game.restart()
        index = 0
        nextButton.hidden = true
        hitButton.hidden = false
        standButton.hidden = false
        currentPlayer = game.players.first!
        refresh()
        var temp:Int = moneyStart - betAmount.text.toInt()!
        moneyStart = temp
        maxAmount.text = String("$\(temp)")
        if(moneyStart - betAmount.text.toInt()! < 0) {
            maxAmount.text = String("00")
            gameOutcome.text = String("You have no money left, sorry!")
            game.restart()
            playButton.enabled = false
            playButton.hidden = true
        }
    }
    
    
    @IBAction func hitButton(sender: UIButton) {
        game.hit(currentPlayer)
        refresh()
    }
    
    
    @IBAction func standButton(sender: UIButton) {
        currentPlayer.stood = true
        game.stand(currentPlayer)
        index+=1
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

