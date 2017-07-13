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
    @IBOutlet weak var foodNameTextField: UITextField!
    
    var foodArray: [Food] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(foodArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func enterButtonPressed(_ sender: Any) {
        if caloriesTextField == nil || caloriesTextField.text == "" {
            vibratePhone()
            caloriesTextField.placeholder = "You have not entered an amount"
        } else {
            let newFood = Food(name: foodNameTextField.text!, calories: Int(caloriesTextField.text!)!)
            foodArray.append(newFood)
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
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
}
