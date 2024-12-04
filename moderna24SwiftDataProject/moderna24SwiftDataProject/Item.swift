//
//  Item.swift
//  moderna24SwiftDataProject
//
//  Created by Andreas Nygren on 2024-12-03.
//

import Foundation
import SwiftData

@Model
final class ThingToDo {
    var thingToDo: String
    var done: Bool
    
    init(thingToDo: String, done: Bool = false) {
        
        self.thingToDo = thingToDo
        self.done = done
    }
}
