//
//  DataManager.swift
//  WomensWorldCup2023
// 
//  Created by devesmee on 22/03/2024.
//

import Foundation

protocol DataManager {
    var errorMessage: String? { get }

    var countries: [Country] { get }
    var matches: [Match] { get }

    func getCountries()
    func getMatches()
}
