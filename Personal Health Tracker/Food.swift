//
//  Food.swift
//  Personal Health Tracker
//
//  Created by Saim Zahid on 2017-07-13.
//  Copyright © 2017 Saim Zahid. All rights reserved.
//

import Foundation

class Food {
    var calories: Int!
    var name: String!
    
    init(name: String, calories: Int) {
        self.name = name
        self.calories = calories
    }
}
