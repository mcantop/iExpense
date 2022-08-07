//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Maciej on 06/08/2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
