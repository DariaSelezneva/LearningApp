//
//  CourseDetailsViewModel.swift
//  LearningApp
//
//  Created by Daria on 14.04.2022.
//

import UIKit

struct CourseDetailsViewModel {
    var id: Int
    var title: String
    var description: String
    var previewImage: UIImage?
    var videoURL: URL?
    var duration: String
    var numberOfLessons: String
    var theme: String
    var cost: String
    var authorName: String
    var authorImage: UIImage
    var authorPosition: String
    var isOnline: Bool
    var lessons: [LessonViewModel]
    var extras: String?
    var isFavorite: Bool
}

extension CourseDetailsViewModel {
    init(from course: Course, isFavorite: Bool) {
        self.id = course.id
        self.title = course.title
        self.description = course.description
        self.previewImage = course.previewImage
        self.videoURL = course.videoURL
        let hours = course.duration / 60
        let minutes = course.duration % 60
        self.duration = "\(hours)h \(minutes)m"
        self.numberOfLessons = "\(course.numberOfLessons) lessons"
        self.theme = course.theme
        self.cost = course.cost == 0 ? "Free" : "\(course.currency)\(course.cost)"
        self.authorName = course.author.name
        self.authorImage = course.author.image ?? UIImage(systemName: "person")!
        self.authorPosition = course.author.position
        self.isOnline = course.author.isOnline
        self.extras = course.extras
        self.lessons = course.lessons
        self.isFavorite = isFavorite
    }
}
