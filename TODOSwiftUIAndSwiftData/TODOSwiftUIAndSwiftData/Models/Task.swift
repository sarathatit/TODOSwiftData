//
//  Task.swift
//  TODOSwiftUIAndSwiftData
//
//  Created by Sarath kumar on 05/12/24.
//

import Foundation
import SwiftData

@Model
class Task {
    var title: String
    var subTitle: String
    var isCompleted: Bool
    
    init(title: String, subTitle: String, isCompleted: Bool = false) {
        self.title = title
        self.subTitle = subTitle
        self.isCompleted = isCompleted
    }
}
