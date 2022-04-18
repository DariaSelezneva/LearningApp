//
//  HomeInteractor.swift
//  LearningApp
//
//  Created by Daria on 13.04.2022.
//

import Foundation

protocol HomeInteractionLogic {
    func getUser()
    func getStreamers()
    func getFilters()
    func getCourses()
    func didSelectFilter(_ filter: String)
}

final class HomeInteractor: HomeInteractionLogic {
    
    var dataStore : DataStore = DataStore.shared
    var presenter : HomePresentationLogic?
    
    func getUser() {
        if let user = dataStore.user {
            presenter?.presentUser(user)
        }
    }
    
    func getStreamers() {
        presenter?.presentStreamers(dataStore.streamers)
    }
    
    func getFilters() {
        presenter?.presentFilters(dataStore.filters, selectedFilter: 0)
    }
    
    func getCourses() {
        presenter?.presentCourses(Course.sample)
    }
    
    func didSelectFilter(_ filter: String) {
        if filter == "All" {
            presenter?.presentFilters(dataStore.filters, selectedFilter: 0)
            presenter?.presentCourses(Course.sample)
        }
        else {
            let filterIndex = Int(dataStore.filters.firstIndex(of: filter) ?? 0)
            presenter?.presentFilters(dataStore.filters, selectedFilter: filterIndex)
            presenter?.presentCourses(Course.sample.filter({$0.theme == filter}))
        }
    }
}
