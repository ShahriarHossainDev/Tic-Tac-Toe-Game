//
//  PlayVC.swift
//  Tic Tac Toe Game
//
//  Created by Shishir_Mac on 18/7/22.
//

import UIKit

class PlayVC: UIViewController {
    
    @IBOutlet weak var play1, play2, play3, play4, play5, play6, play7, play8, play9: UIButton!
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var itsLabel: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playAgainButton: UIButton!
    
    // 1 is nought, 2 is cross
    var turnCount = 0
    var activePlayer = 2
    var activeGame = true
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] // 0 - empty 1 - cross 2 - nought
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillTitle()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Function
    
    func fillTitle(){
        play1.setTitle("", for: .normal)
        play2.setTitle("", for: .normal)
        play3.setTitle("", for: .normal)
        play4.setTitle("", for: .normal)
        play5.setTitle("", for: .normal)
        play6.setTitle("", for: .normal)
        play7.setTitle("", for: .normal)
        play8.setTitle("", for: .normal)
        play9.setTitle("", for: .normal)
        
        playAgainButton.setTitle("Play Again", for: .normal)
        playAgainButton.layer.cornerRadius = 8
        playAgainButton.isHidden = true
        
    }
    
    @IBAction func playAgainButtonAction(_ sender: UIButton) {
        
        let refreshAlert = UIAlertController(title: "Play Again!", message: "Are You Sure to restart game?", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [self] (action: UIAlertAction!) in
            
            turnCount = 0
            activePlayer = 2
            activeGame = true
            gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
            
            winnerLabel.text = "turn!"
            playerImage.image = UIImage(named: "ico_X")
            
            play1.setImage(UIImage(named: "box"), for: .normal)
            play2.setImage(UIImage(named: "box"), for: .normal)
            play3.setImage(UIImage(named: "box"), for: .normal)
            play4.setImage(UIImage(named: "box"), for: .normal)
            play5.setImage(UIImage(named: "box"), for: .normal)
            play6.setImage(UIImage(named: "box"), for: .normal)
            play7.setImage(UIImage(named: "box"), for: .normal)
            play8.setImage(UIImage(named: "box"), for: .normal)
            play9.setImage(UIImage(named: "box"), for: .normal)
            
            playAgainButton.isHidden = true
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
            
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let activePosition = sender.tag - 1
        
        turnCount = turnCount + 1
        
        if gameState[activePosition] == 0  && activeGame{
            gameState[activePosition] = activePlayer
            
            if activePlayer == 2 {
                sender.setImage(UIImage(named: "ico_X"), for: [])
                activePlayer = 1
                winnerLabel.text = "turn!"
                playerImage.image = UIImage(named: "ico_X")
            } else {
                sender.setImage(UIImage(named: "ico_O"), for: [])
                activePlayer = 2
                winnerLabel.text = "turn!"
                playerImage.image = UIImage(named: "ico_O")
            }
            
            for combinations in winningCombinations {
                if gameState[combinations[0]] != 0 && gameState[combinations[0]] == gameState[combinations[1]] && gameState[combinations[1]] == gameState[combinations[2]]{
                    // we have a winner!
                    activeGame = false
                    
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                    
                    if gameState[combinations[0]] == 1 {
                        winnerLabel.text = "WINS!"
                        playerImage.image = UIImage(named: "ico_O")
                    } else if gameState[combinations[1]] == 2{
                        winnerLabel.text = "WINS!"
                        playerImage.image = UIImage(named: "ico_X")
                    }
                }
            }
            
            if activeGame && turnCount == 9 {
                winnerLabel.text = "IT'S A DRAW!"
                activeGame = false
            }
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
