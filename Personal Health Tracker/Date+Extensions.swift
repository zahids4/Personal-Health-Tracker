//
//  Date+Extensions.swift
//  Personal Health Tracker
//
//  Created by Saim Zahid on 2017-07-13.
//  Copyright © 2017 Saim Zahid. All rights reserved.
//

import Foundation

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
    
    func monthOfYear() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self).capitalized
    }
}
