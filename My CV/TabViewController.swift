//
//  TabViewController.swift
//  My CV
//
//  Created by Emilio Del Castillo on 05/11/2020.
//

import UIKit

class TabViewController: UIViewController {

    private let card = CardView();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let _ = cardsStack {
            addCard()
        }
        
    }
    
    
    @IBOutlet weak var cardsStack: UIStackView!
    
    private func addCard(){
        let test = CardView()
        cardsStack.addArrangedSubview(test)
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
