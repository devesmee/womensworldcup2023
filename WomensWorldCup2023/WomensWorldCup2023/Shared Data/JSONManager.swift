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
    var stadiumsErrorMessage: String?
    
    var countries = [Country]()
    var matches = [Match]()
    var stadiums = [Stadium]()
    
    func getCountries() {
        guard let decodedTeams = [Country].loadData(resource: "countries") else {
            self.countriesErrorMessage = "Could not retrieve teams, please try again later"
            return
        }

        self.countries = decodedTeams.sortedByAlphabet
    }
    
    func getMatches() {
        guard let decodedMatches = [Match].loadData(resource: "matches") else {
            self.matchesErrorMessage = "Could not retrieve matches, please try again later"
            return
        }

        self.matches = decodedMatches.sortedByDate
    }
    
    func getStadiums() {
        guard let decodedStadiums = [Stadium].loadData(resource: "stadiums") else {
            self.stadiumsErrorMessage = "Could not retrieve stadiums, please try again later"
            return
        }

        self.stadiums = decodedStadiums
    }
}


