//
//  Reminder.swift
//  MakeItSo
//
//  Created by Shirke, Soham Ramesh (Soham) on 03/09/24.
//

import Foundation

struct Reminder: Identifiable{
    let id = UUID()
    var title: String
    var isCompleted = false
}

extension Reminder {
    static let samples: [Reminder] = [
        ]
}
