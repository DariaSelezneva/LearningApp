//
//  CourseViewModel.swift
//  LearningApp
//
//  Created by Daria on 13.04.2022.
//

import Foundation
import UIKit

struct CourseViewModel {
    var id: Int
    var title: String
    var image: UIImage
    var duration: String
    var numberOfLessons: Int
    var theme: String
    var cost: String
    var authorName: String
    var authorImage: UIImage
    var authorPosition: String
    var extras: String?
    
    static let firstSample = CourseViewModel(id: 0, title: "TARDIS and wibbly-wobbly timey-wimey stuff for beginners", image: UIImage(named: "tardis")!, duration: "5h 21m", numberOfLessons: 6, theme: "TARDIS", cost: "Free", authorName: "Marta Jones", authorImage: UIImage(named: "marta")!, authorPosition: "Doctor companion", extras: "Free e-book")
    
    static let secondSample = CourseViewModel(id: 1, title: "100 ways to kill time when you are immortal", image: UIImage(named: "knitting")!, duration: "4h 45m", numberOfLessons: 8, theme: "Other", cost: "$40", authorName: "Rory Williams", authorImage: UIImage(named: "rory")!, authorPosition: "Doctor companion")
    
    static let thirdSample = CourseViewModel(id: 2, title: "Daleks and how to fight them", image: UIImage(named: "dalek")!, duration: "2h 20m", numberOfLessons: 4, theme: "Creatures", cost: "$20", authorName: "Rose Tyler", authorImage: UIImage(named: "rose")!, authorPosition: "Doctor companion", extras: nil)
    
    static let sample = [firstSample, secondSample, thirdSample]
}
