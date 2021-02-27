//
//  HobbieViewController.swift
//  My CV
//
//  Created by Emilio Del Castillo on 26/02/2021.
//

import UIKit

class HobbieViewController: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var data = HobbiesData.shared.hobbies
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 70
        tableView.rowHeight = UITableView.automaticDimension
    }

}

extension HobbieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hobbieCell", for: indexPath) as! HobbieCustomCell
        
        cell.cardView.title = data[indexPath.row].title
        cell.cardView.desc = data[indexPath.row].desc
        cell.cardView.layoutIfNeeded()
        
        return cell
    }
    
    
}
