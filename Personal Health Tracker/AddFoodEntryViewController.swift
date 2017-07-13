//
//  AddFoodEntryViewController.swift
//  Personal Health Tracker
//
//  Created by Saim Zahid on 2017-07-13.
//  Copyright © 2017 Saim Zahid. All rights reserved.
//

import UIKit
import AudioToolbox

class AddFoodEntryViewController: UIViewController {
    @IBOutlet weak var caloriesTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func enterButtonPressed(_ sender: Any) {
        if caloriesTextField == nil || caloriesTextField.text == "" {
            vibratePhone()
            caloriesTextField.placeholder = "Enter a caloric amount"
        } else {
            performSegue(withIdentifier: "unwindSegueToLandingPage", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindSegueToLandingPage" {
            let landingPageVC = segue.destination as! LandingPage
            landingPageVC.caloriesToAdd = Int(caloriesTextField.text!)!
        }
    }

}

extension AddFoodEntryViewController {
    func vibratePhone() {
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
        feedbackGenerator.impactOccurred()
    }
}
