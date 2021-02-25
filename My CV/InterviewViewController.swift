//
//  InterviewViewController.swift
//  My CV
//
//  Created by Emilio Del Castillo on 25/02/2021.
//

import UIKit

class InterviewViewController: UIViewController {
    let interviewTypes = ["Sur place", "En visioconférence"]
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var typePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.minimumDate = Date(timeIntervalSinceNow: 0)
        
        typePicker.delegate = self
        typePicker.dataSource = self
        
    }
    

    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendInvitation(_ sender: UIButton) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "fr_FR")
        
        let chosenDate = dateFormatter.string(from: datePicker.date)
        let chosenType = interviewTypes[typePicker.selectedRow(inComponent: 0)]
        
        let message = "Invitation envoyée pour le \(chosenDate), \(chosenType.lowercased())"
        
        let alert = UIAlertController(title: "Invitation envoyée",
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // TODO: Send the invitation!
            print("Invitation sent")
            self.dismiss(animated: true)
        }
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
}

extension InterviewViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        interviewTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return interviewTypes[row]
    }
}
