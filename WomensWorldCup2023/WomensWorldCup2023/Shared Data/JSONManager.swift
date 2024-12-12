//
//  JSONManager.swift
//  WomensWorldCup2023
// 
//  Created by devesmee on 22/03/2024.
//

import Foundation

@Observable class JSONManager: DataManager {
    
    var errorMessage: String?
    
    var countries: [Country] = []
    var matches: [Match] = []
    
    func getCountries() {
        guard let decodedTeams = [Country].loadData(resource: "countries") else {
            self.errorMessage = "Error while retrieving teams"
            return
        }

        self.countries = decodedTeams.sortedByAlphabet
    }
    
    func getMatches() {
        guard let decodedTeams = [Match].loadData(resource: "matches") else {
            self.errorMessage = "Error while retrieving matches"
            return
        }

        self.matches = decodedTeams.sortedByDate
    }
}


