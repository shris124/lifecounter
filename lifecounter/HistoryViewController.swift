//
//  HistoryViewController.swift
//  lifecounter
//
//  Created by Victoria Shepard on 6/6/22.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var historyTable: UITableView!
    
    var history:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTable.delegate = self
        historyTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.text = self.history[indexPath.row]

        return cell
    }


    @IBAction func backtoGame(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
