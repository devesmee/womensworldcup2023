//
//  DataManager.swift
//  WomensWorldCup2023
// 
//  Created by devesmee on 22/03/2024.
//

import Foundation

protocol DataManager {
    var countriesErrorMessage: String? { get }
    var matchesErrorMessage: String? { get }
    var stadiumsErrorMessage: String? { get }
    var groupsErrorMessage: String? { get }

    var countries: [Country] { get }
    var matches: [Match] { get }
    var stadiums: [Stadium] { get }
    var groups: [Group] { get }

    func getData()
}

extension DataManager {
    var countriesPath: String { "countries" }
    var matchesPath: String { "matches" }
    var stadiumsPath: String { "stadiums" }
    var groupsPath: String { "groups" }
}
