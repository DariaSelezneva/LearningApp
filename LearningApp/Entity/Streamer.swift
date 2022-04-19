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
        Streamer(person: Person.rose, isStreaming: true),
        Streamer(person: Person.rory, isStreaming: true),
        Streamer(person: Person.capaldi, isStreaming: true),
        Streamer(person: Person.marta, isStreaming: true)
    ]
}
