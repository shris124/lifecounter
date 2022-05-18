//
//  ViewController.swift
//  lifecounter
//
//  Created by iguest on 5/17/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var p1LifeCount: UILabel!
    @IBOutlet weak var p2LifeCount: UILabel!
    @IBOutlet weak var loserLabel: UILabel!
    
    @IBOutlet weak var p1plus5: UIButton!
    @IBOutlet weak var p1minus5: UIButton!
    @IBOutlet weak var p1plus1: UIButton!
    @IBOutlet weak var p1minus1: UIButton!
    
    @IBOutlet weak var p2plus5: UIButton!
    @IBOutlet weak var p2minus5: UIButton!
    @IBOutlet weak var p2plus1: UIButton!
    @IBOutlet weak var p2minus1: UIButton!
    
    var currp1LifeCount = 20
    var currp2LifeCount = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        p1LifeCount.text = "\(currp1LifeCount)"
        p2LifeCount.text = "\(currp2LifeCount)"
        loserLabel.text = ""
        // Do any additional setup after loading the view.
    }

    func updateLifeCount(_ player: String, _ count: Int) {
       if (player == "p1") {
           currp1LifeCount += count
           if (currp1LifeCount <= 0) {
               currp1LifeCount = 0
               loserLabel.text = "Player 1 LOSES!"
               p1LifeCount.text = "\(currp1LifeCount)"
           } else {
               p1LifeCount.text = "\(currp1LifeCount)"
           }
       } else if (player == "p2") {
           currp2LifeCount += count
           if (currp2LifeCount <= 0) {
               currp2LifeCount = 0
               loserLabel.text = "Player 2 LOSES!"
               p2LifeCount.text = "\(currp2LifeCount)"
           } else {
               p2LifeCount.text = "\(currp2LifeCount)"
           }
       }
    }
    
    @IBAction func p1plus5(_ sender: Any) {
        updateLifeCount("p1", 5)
    }
    
    @IBAction func p1minus5(_ sender: Any) {
        updateLifeCount("p1", -5)
    }
    
    @IBAction func p1plus1(_ sender: Any) {
        updateLifeCount("p1", 1)
    }
    
    @IBAction func p1minus1(_ sender: Any) {
        updateLifeCount("p1", -1)
    }
    
    @IBAction func p2plus5(_ sender: Any) {
        updateLifeCount("p2", 5)
    }
    
    @IBAction func p2minus5(_ sender: Any) {
        updateLifeCount("p2", -5)
    }
    
    @IBAction func p2plus1(_ sender: Any) {
        updateLifeCount("p2", 1)
    }
    
    @IBAction func p2minus1(_ sender: Any) {
        updateLifeCount("p2", -1)
    }
}

