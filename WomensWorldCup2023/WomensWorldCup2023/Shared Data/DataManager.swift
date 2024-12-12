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

    var countries: [Country] { get }
    var matches: [Match] { get }
    var stadiums: [Stadium] { get }

    func getCountries()
    func getMatches()
    func getStadiums()
}
