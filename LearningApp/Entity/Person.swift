//
//  Person.swift
//  LearningApp
//
//  Created by Daria on 18.04.2022.
//

import UIKit

struct Person {
    var id: Int
    var name: String
    var image: UIImage?
    var position: String
    var isOnline: Bool
    
    static let eccleston = Person(id: 0, name: "Doctor", image: UIImage(named: "eccleston"), position: "9th", isOnline: false)
    static let tennant = Person(id: 1, name: "Doctor", image: UIImage(named: "tennant"), position: "10th", isOnline: false)
    static let smith = Person(id: 2, name: "Doctor", image: UIImage(named: "smith"), position: "11th", isOnline: false)
    static let capaldi = Person(id: 3, name: "Doctor", image: UIImage(named: "capaldi"), position: "12th", isOnline: true)
    static let marta = Person(id: 4, name: "Marta Jones", image: UIImage(named: "marta"), position: "Doctor companion", isOnline: true)
    static let rory = Person(id: 5, name: "Rory Williams", image: UIImage(named: "rory"), position: "Doctor companion", isOnline: false)
    static let rose = Person(id: 6, name: "Rose Tyler", image: UIImage(named: "rose"), position: "Doctor companion", isOnline: false)
    static let strax = Person(id: 7, name: "Strax", image: UIImage(named: "strax"), position: "Sontaran warrior", isOnline: true)
    static let danny = Person(id: 8, name: "Danny Pink", image: UIImage(named: "danny"), position: "", isOnline: true)
    static let jack = Person(id: 9, name: "Jack Harkness", image: UIImage(named: "jack"), position: "Torchwood Agent", isOnline: false)
    static let sample = [danny, strax, capaldi, marta, rose, rory]
}
