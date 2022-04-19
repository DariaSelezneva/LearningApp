//
//  ScheduleViewModel.swift
//  LearningApp
//
//  Created by Daria on 19.04.2022.
//

import Foundation

struct ScheduleViewModel {
    var time: String
    var isAvailable: Bool
    
    static let sample: [ScheduleViewModel] = [
        ScheduleViewModel(time: "9:00", isAvailable: true),
        ScheduleViewModel(time: "9:30", isAvailable: false),
        ScheduleViewModel(time: "10:00", isAvailable: true),
        ScheduleViewModel(time: "10:30", isAvailable: true),
        ScheduleViewModel(time: "11:00", isAvailable: true),
        ScheduleViewModel(time: "11:30", isAvailable: false),
        ScheduleViewModel(time: "12:00", isAvailable: true),
        ScheduleViewModel(time: "12:30", isAvailable: true),
        ScheduleViewModel(time: "13:30", isAvailable: false)]
}
