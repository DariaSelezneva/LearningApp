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
    
    static let firstSample = CourseDetailsViewModel(
        id: 0,
        title: "TARDIS and wibbly-wobbly timey-wimey stuff for beginners",
        previewImage: UIImage(named: "tardis")!,
        videoURL: nil,
        duration: "5h 21m",
        numberOfLessons: "6 lessons",
        theme: "TARDIS",
        cost: "Free",
        authorName: "Marta Jones",
        authorImage: UIImage(named: "marta")!,
        authorPosition: "Doctor companion",
        isOnline: true,
        lessons: LessonViewModel.sample,
        extras: "Free e-book")
    
    static let secondSample = CourseDetailsViewModel(
        id: 1,
        title: "100 ways to kill time when you are immortal",
        previewImage: UIImage(named: "knitting")!,
        videoURL: nil,
        duration: "4h 45m",
        numberOfLessons: "10 lessons",
        theme: "Other",
        cost: "$40",
        authorName: "Rory Williams",
        authorImage: UIImage(named: "rory")!,
        authorPosition: "Doctor companion",
        isOnline: false,
        lessons: [])
    
    static let thirdSample = CourseDetailsViewModel(
        id: 2,
        title: "Daleks and how to fight them",
        previewImage: UIImage(named: "dalek")!,
        videoURL: nil,
        duration: "2h 20m",
        numberOfLessons: "4 lessons",
        theme: "Creatures",
        cost: "$20",
        authorName: "Rose Tyler",
        authorImage: UIImage(named: "rose")!,
        authorPosition: "Doctor companion",
        isOnline: false,
        lessons: [])
    
    static let sample = [firstSample, secondSample, thirdSample]
}
