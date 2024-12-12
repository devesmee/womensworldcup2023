//
//  JSONManager.swift
//  WomensWorldCup2023
// 
//  Created by devesmee on 22/03/2024.
//

import Foundation

@Observable class JSONManager: DataManager {
    
    var countriesErrorMessage: String?
    var matchesErrorMessage: String?
    
    var countries: [Country] = []
    var matches: [Match] = []
    
    func getCountries() {
        guard let decodedTeams = [Country].loadData(resource: "countries") else {
            self.countriesErrorMessage = "Could not retrieve teams, please try again later"
            return
        }

        self.countries = decodedTeams.sortedByAlphabet
    }
    
    func getMatches() {
        guard let decodedTeams = [Match].loadData(resource: "matches") else {
            self.matchesErrorMessage = "Could not retrieve matches, please try again later"
            return
        }

        self.matches = decodedTeams.sortedByDate
    }
}


