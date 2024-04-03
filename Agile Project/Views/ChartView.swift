//
//  ChartView.swift
//  Agile Project
//
//  Created by Pavly Paules on 02/04/2024.
//

import Foundation
import SwiftUI

struct ChartView: Identifiable {
    let id = UUID()
    let data: Date
    let viewCount: Int
}

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}
