//
//  LessonViewModel.swift
//  LearningApp
//
//  Created by Дарья Селезнёва on 15.04.2022.
//

import Foundation

struct LessonViewModel {
    var id: Int
    var title: String
    var duration: String
    
    static let sample = [LessonViewModel(id: 0, title: "Brief history of TARDIS: from Gallifrey war to today", duration: "17:10m"),
                         LessonViewModel(id: 1, title: "Quantum physics basics", duration: "34:17m"),
                         LessonViewModel(id: 2, title: "TARDIS operation basics: switch on and off, select time", duration: "12:12m")]
}
