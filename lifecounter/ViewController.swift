//
//  ViewController.swift
//  lifecounter
//
//  Created by iguest on 5/17/22.
//

import UIKit

class ViewController: UIViewController, playerDelegate {
    
    @IBOutlet weak var AddPlayer: UIButton!
    @IBOutlet weak var RemovePlayer: UIButton!
    @IBOutlet weak var ResetButton: UIButton!
    @IBOutlet weak var PlayerLabel: UILabel!
    @IBOutlet weak var PlayersList: UIStackView!
    
    var playersAlive = 4
    var history:[String] = []
    var playerList: [PlayerViewController] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ResetButton.isHidden = true
        PlayerLabel.isHidden = true
        for i in 0...3 {
            createPlayer(i: i)
        }
    }
    
    func createPlayer(i: Int) {
        let newPlayer = PlayerViewController()
        newPlayer.data = (i)
        newPlayer.tag = i
        newPlayer.delegate = self
        playerList.append(newPlayer)
        PlayersList.addArrangedSubview(newPlayer)
    }
    
    @IBAction func AddNewPlayer(_ sender: Any) {
        createPlayer(i: playersAlive)
        playersAlive += 1
        if playersAlive == 8 {
            AddPlayer.isEnabled = false
        }
        if playersAlive != 2 {
            RemovePlayer.isEnabled = true
        }
    }
    
    @IBAction func RemovePlayer(_ sender: Any) {
        playersAlive -= 1
        for i in 0...(playerList.count - 1) {
            if (playerList[i]).tag == playersAlive {
                playerList[i].removeFromSuperview()
                playerList.remove(at: i)
            }
        }
        if playersAlive != 8 {
            AddPlayer.isEnabled = true;
        }
        if playersAlive == 2 {
            RemovePlayer.isEnabled = false;
        }
    }
    
    @IBAction func ResetGame(_ sender: Any) {
        PlayerLabel.isHidden = true
        history = []
        playerList = []
        for view in PlayersList.subviews {
            view.removeFromSuperview()
        }
        for i in 0...3 {
            createPlayer(i: i)
        }
        playersAlive = 4
        AddPlayer.isEnabled = true
        RemovePlayer.isEnabled = true
        ResetButton.isHidden = true
    }
    
    func addEvent(player: String, action: String, num: Int) {
        var text = player
        switch action {
        case "+":
            text += " gained " + String(num) + " life."
        case "-":
            text += " lost " + String(num) + " life."
        default:
            text += " Loses!"
        }
        history.append(text)
    }
    
    func checkScore(score: Int, player: String) {
        if score <= 0 {
            PlayerLabel.text = "\(player) LOSES!"
            PlayerLabel.isHidden = false
            addEvent(player: player, action: "lose", num: 0)
            playersAlive -= 1;
        }
        
        if playersAlive == 1 {
            
            PlayerLabel.text = "Game Over!"
            ResetButton.isHidden = false
        }
    }
    
    func gameStart() {
        AddPlayer.isEnabled = false
        RemovePlayer.isEnabled = false
    }
    
    func present(alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
    }
    
    func hideMessage() {
        PlayerLabel.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier
        {
        case Optional("gameToHistory"):
            let historyVC = segue.destination as? HistoryViewController
            historyVC?.history = history
            break;
        default:
            print("something is wrong")
        }
    }

}

protocol playerDelegate {
    func addEvent(player: String, action: String, num: Int)
    func checkScore(score: Int, player: String)
    func gameStart()
    func present(alertController: UIAlertController)
    func hideMessage()
}

