//
//  ViewController.swift
//  CardWars
//
//  Created by Dev on 2015-07-29.
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgLeftCard: UIImageView!
    @IBOutlet weak var imgRightCard: UIImageView!
    @IBOutlet weak var btnDraw: UIButton!
    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var txtPlayerScore: UILabel!
    @IBOutlet weak var txtEnemyScore: UILabel!
    
    var cardArray:[String] = ["card1", "card2", "card3","card4","card5","card6","card7","card8","card9","card10","jack","queen","king","joker"]
    
    var playerScore:Int = 0;
    var enemyScore:Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actnDrawTapped(sender: UIButton) {
        //Draw cards
        var leftCardRand:Int = Int(arc4random_uniform(14))
        var rightCardRand:Int = Int(arc4random_uniform(14))
        
        self.imgLeftCard.image = UIImage(named: cardArray[leftCardRand])
        self.imgRightCard.image = UIImage(named: cardArray[rightCardRand])
        
        //Who wins
        self.findWinner(leftCardRand, enemy: rightCardRand)
    }
    @IBAction func btnRestart(sender: UIButton) {
        playerScore = 0
        enemyScore = 0
        txtPlayerScore.text = String(playerScore)
        txtEnemyScore.text = String(enemyScore)
        var winner:String = ""
        if (playerScore > enemyScore){
            winner = "The Player!"
        }
        else if(playerScore < enemyScore){
            winner = "The Enemy!"
        }
        else{
            winner = "No one!"
        }
        var alert = UIAlertController(title: "Winner is:", message: winner, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "New Game", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
/* Func:Determins the winner of a card pair.
        Jokers(13) are wild and always win
        Ace's high
*/
    func findWinner(player: Int, enemy: Int){
        //tie
        if(player == enemy){}
            
        // player gets an ace
        else if(player == 0){
            //only jokers beat aces
            if(enemy == 13){
                enemyScore += 1
                txtEnemyScore.text = String(enemyScore)
            }
            else{
                playerScore += 1
                txtPlayerScore.text = String(playerScore)
            }
        }
            
        //enemy gets an ace
        else if (enemy == 0){
            //only jokers beat aces
            if(player == 13){
                playerScore += 1
                txtPlayerScore.text = String(playerScore)
            }
            else{
                enemyScore += 1
                txtEnemyScore.text = String(enemyScore)
            }
        }
            
        //else the highest score wins
        else{
            if(player > enemy){
                playerScore += 1
                txtPlayerScore.text = String(playerScore)
            }
            else{
                enemyScore += 1
                txtEnemyScore.text = String(enemyScore)
            }
        }
    }

}

