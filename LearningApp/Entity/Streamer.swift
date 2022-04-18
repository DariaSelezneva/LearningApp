//
//  Streamer.swift
//  LearningApp
//
//  Created by Daria on 18.04.2022.
//

import UIKit

struct Streamer {
    var person: Person
    var isStreaming: Bool
    
    static let sample = [
        Streamer(person: Person(id: 0, name: "Doctor", image: UIImage(named: "eccleston"), position: "9th", isOnline: true), isStreaming: true),
        Streamer(person: Person(id: 1, name: "Doctor", image: UIImage(named: "tennant"), position: "10th", isOnline: true), isStreaming: true),
        Streamer(person: Person(id: 2, name: "Doctor", image: UIImage(named: "smith"), position: "11th", isOnline: true), isStreaming: true),
        Streamer(person: Person(id: 3, name: "Doctor", image: UIImage(named: "capaldi"), position: "12th", isOnline: true), isStreaming: true)
    ]
}
