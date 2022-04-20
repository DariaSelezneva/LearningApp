//
//  Chat.swift
//  LearningApp
//
//  Created by Daria on 20.04.2022.
//

import Foundation

struct Chat {
    var person: Person
    var messages: [Message]
    
    static let sample = [
        Chat(person: Person.danny, messages: [
            Message(id: 0, personID: Person.danny.id, text: "Would you like to have dinner today? I've found a good restaurant near our school", date: Date().addingTimeInterval(-60), isRead: false),
            Message(id: 1, personID: Person.danny.id, text: "", date: Date().addingTimeInterval(-70), isRead: false),
            Message(id: 2, personID: Person.danny.id, text: "", date: Date().addingTimeInterval(-70), isRead: false)]),
        
        Chat(person: Person.strax, messages: [
            Message(id: 3, personID: Person.strax.id, text: "For the glory of the Sontaran Empire!", date: Date().addingTimeInterval(-250), isRead: false)]),
        
        Chat(person: Person.rose, messages: [
            Message(id: 7, personID: Person.rose.id, text: ":)))", date: Date().addingTimeInterval(-4000), isRead: true)]),
        
        Chat(person: Person.capaldi, messages: [
            Message(id: 3, personID: Person.capaldi.id, text: "Clara, where are you?", date: Date().addingTimeInterval(-10000), isRead: false),
            Message(id: 4, personID: Person.capaldi.id, text: "", date: Date().addingTimeInterval(-11000), isRead: false)]),
        
        Chat(person: Person.jack, messages: [
            Message(id: 5, personID: Person.jack.id, text: "Have you ever been in Torchwood?", date: Date().addingTimeInterval(-86400), isRead: true)]),
        
        Chat(person: Person.marta, messages: [
            Message(id: 7, personID: Person.marta.id, text: "Haha exactly )", date: Date().addingTimeInterval(-86400 * 2), isRead: true)]),
        
        Chat(person: Person.smith, messages: [
            Message(id: 7, personID: Person.smith.id, text: "I'll send you my new telephone number, when the transformation ends", date: Date().addingTimeInterval(-86400 * 6), isRead: true)])
    ]
}
