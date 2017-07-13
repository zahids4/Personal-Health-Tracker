//
//  LandingPage.swift
//  Personal Health Tracker
//
//  Created by Saim Zahid on 2017-07-13.
//  Copyright © 2017 Saim Zahid. All rights reserved.
//

import UIKit

class LandingPage: UIViewController {
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateSuffixLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
    }
    
    fileprivate func configureLabels() {
        yearLabel.text = String(dateComponents().0)
        monthLabel.text = dateComponents().1
        dateLabel.text = String(dateComponents().2)
        dateSuffixLabel.text = dateSuffix(from: Date())
        dayOfWeekLabel.text = dateComponents().3
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension LandingPage {
    func dateComponents() -> (Int, String, Int, String) {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .weekday], from: date)
        
        let year =  components.year
        let month = date.monthOfYear()
        let day = components.day
        let weekday = date.dayOfWeek()
        
        return (year!, month!, day!, weekday!)
    }
    
    func dateSuffix(from date: Date) -> String {
        let calendar = Calendar.current
        let dayOfMonth = calendar.component(.day, from: date)
        switch dayOfMonth {
        case 1, 21, 31: return "st"
        case 2, 22: return "nd"
        case 3, 23: return "rd"
        default: return "th"
        }
    }
}

