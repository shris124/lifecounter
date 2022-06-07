//
//  PlayerViewController.swift
//  lifecounter
//
//  Created by Victoria Shepard on 6/6/22.
//

import UIKit

class PlayerViewController: UIView {

    var delegate: playerDelegate?
    var lifeCount = 20
    var addNValue = 5
    var minusNValue = 5
    var players = ["Player 1", "Player 2", "Player 3", "Player 4", "Player 5", "Player 6", "Player 7", "Player 8"]
    

    @IBOutlet weak var playerName: UIButton!
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var plusNbutton: UIButton!
    @IBOutlet weak var minusNButton: UIButton!
    
    
    var data : (Int) = (-1) {
        didSet {
            playerName.setTitle(players[data], for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let nib = UINib(nibName: "Player", bundle: nil)
        let nibInstance = nib.instantiate(withOwner: self, options: nil)
        let nibView = (nibInstance.first) as! UIView
        addSubview(nibView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let nib = UINib(nibName: "Player", bundle: nil)
        let nibInstance = nib.instantiate(withOwner: self, options: nil)
        let nibView = (nibInstance.first) as! UIView
        addSubview(nibView)
    }
    
    func reset() {
        lifeCount = 20
        playerScore.text = "20"
    }
    
    @IBAction func EditNbutton(_ sender: Any) {
        let alertController = UIAlertController(title: "Enter new value", message: nil, preferredStyle: .alert)
        alertController.addTextField {(textField) -> Void in
            textField.keyboardType = UIKeyboardType.numberPad
            textField.placeholder = self.minusNButton.currentTitle
            textField.placeholder = self.plusNbutton.currentTitle
        }
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            let name = alertController.textFields?[0].text
            if (Int(name!) != nil) {
                self.minusNButton.setTitle("-" + name!, for: .normal)
                self.plusNbutton.setTitle("+" + name!, for: .normal)
                self.minusNValue = Int(name!)!
                self.addNValue = Int(name!)!
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        delegate!.present(alertController: alertController)
    }
    
    @IBAction func ChangePlayerName(_ sender: Any) {
        let alertController = UIAlertController(title: "Enter new name", message: "Enter name", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            let name = alertController.textFields?[0].text
            (sender as AnyObject).setTitle(name, for: .normal)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addTextField{ (textField) in
            textField.keyboardType = UIKeyboardType.default
            textField.placeholder = (sender as AnyObject).currentTitle
        }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction )
        delegate!.present(alertController: alertController)
    }
    
    @IBAction func plusNtoCount(_ sender: Any) {
        delegate!.hideMessage()
        lifeCount += addNValue
        playerScore.text = String(lifeCount)
        delegate!.addEvent(player: playerName.currentTitle!, action: "+", num: addNValue)
        delegate!.checkScore(score: lifeCount, player: self.playerName.currentTitle!)
        delegate!.gameStart()
    }
    
    @IBAction func minusNtoCount(_ sender: Any) {
        delegate!.hideMessage()
        lifeCount -= minusNValue
        playerScore.text = String(lifeCount)
        delegate!.addEvent(player: playerName.currentTitle!, action: "-", num: minusNValue)
        delegate!.checkScore(score: lifeCount, player: self.playerName.currentTitle!)
        delegate!.gameStart()
    }
    
    @IBAction func plusOnetoCount(_ sender: Any) {
        delegate!.hideMessage()
        lifeCount += 1
        playerScore.text = String(lifeCount)
        delegate!.addEvent(player: playerName.currentTitle!, action: "+", num: 1)
        delegate!.gameStart()
    }
    
    @IBAction func minusOnetoCount(_ sender: Any) {
        delegate!.hideMessage()
        lifeCount -= 1
        playerScore.text = String(lifeCount)
        delegate!.addEvent(player: playerName.currentTitle!, action: "-", num: 1)
        delegate!.checkScore(score: lifeCount, player: self.playerName.currentTitle!)
        delegate!.gameStart()
    }
    
    
    
}
