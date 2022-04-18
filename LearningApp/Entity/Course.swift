//
//  Course.swift
//  LearningApp
//
//  Created by Daria on 18.04.2022.
//

import UIKit

struct Course {
    var id: Int
    var title: String
    var description: String
    var image: UIImage
    var previewImage: UIImage
    var videoURL: URL?
    var duration: Int
    var numberOfLessons: Int
    var theme: String
    var cost: Int
    var currency: String
    var author: Person
    var extras: String?
    var lessons: [LessonViewModel]
    var availableDates: [Date]
    
    static let firstSample = Course(
        id: 0,
        title: "TARDIS and wibbly-wobbly timey-wimey stuff for beginners",
        description: "In this course you’ll learn the history of TARDIS, how it works and basic operations. By the end of the course you will be able to drive TARDIS without Doctor.",
        image: UIImage(named: "tardis")!,
        previewImage: UIImage(named: "tardis")!,
        videoURL: nil,
        duration: 321,
        numberOfLessons: 6,
        theme: "TARDIS",
        cost: 0,
        currency: "$",
        author: Person(id: 0, name: "Marta Jones", image: UIImage(named: "marta"), position: "Doctor companion", isOnline: true),
        extras: "Free e-book",
        lessons: LessonViewModel.sample,
        availableDates: [])
    
    static let secondSample = Course(
        id: 1,
        title: "100 ways to kill time when you are immortal",
        description: "When you’re waiting for a thousand years for your beloved one, time goes by very slowly. Learn how to entertain yourself with this course! There’s everything from knitting to bachata, boredom will have no chance!",
        image: UIImage(named: "knitting")!,
        previewImage: UIImage(named: "knitting")!,
        videoURL: nil,
        duration: 285,
        numberOfLessons: 10,
        theme: "Other",
        cost: 40,
        currency: "$",
        author: Person(id: 1, name: "Rory Williams", image: UIImage(named: "rory"), position: "Doctor companion", isOnline: false),
        lessons: [],
        availableDates: [])
    
    static let thirdSample = Course(
        id: 2,
        title: "Daleks and how to fight them",
        description: "Learn who the daleks are, their strengths and weaknesses, and some little cheats from the author (spoiler: BAD WOLF)",
        image: UIImage(named: "dalek")!,
        previewImage: UIImage(named: "dalek")!,
        videoURL: nil,
        duration: 141,
        numberOfLessons: 4,
        theme: "Creatures",
        cost: 20,
        currency: "$",
        author: Person(id: 2, name: "Rose Tyler", image: UIImage(named: "rose"), position: "Doctor companion", isOnline: false),
        lessons: [],
        availableDates: [])
    
    static let sample = [firstSample, secondSample, thirdSample]
}
