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
    var numberOfLessons: String
    var theme: String
    var cost: String
    var authorName: String
    var authorImage: UIImage
    var authorPosition: String
    var extras: String?
}

extension CourseViewModel {
    init(from course: Course) {
        self.id = course.id
        self.title = course.title
        self.image = course.image
        let hours = course.duration / 60
        let minutes = course.duration % 60
        self.duration = "\(hours)h \(minutes)m"
        self.numberOfLessons = "\(course.numberOfLessons) lessons"
        self.theme = course.theme
        self.cost = course.cost == 0 ? "Free" : "\(course.currency)\(course.cost)"
        self.authorName = course.author.name
        self.authorImage = course.author.image ?? UIImage(systemName: "person")!
        self.authorPosition = course.author.position
        self.extras = course.extras
    }
}
