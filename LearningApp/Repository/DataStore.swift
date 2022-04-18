//
//  DataStore.swift
//  LearningApp
//
//  Created by Daria on 18.04.2022.
//

import Foundation

class DataStore {
    
    static var shared = DataStore()
    private init() {}
    
    var user: User? = User.sample
    var streamers: [Streamer] = Streamer.sample
    var filters: [String] = ["All", "TARDIS", "Creatures", "Other"]
    var courses: [Course] = Course.sample
}
