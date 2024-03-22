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
    
    func getCountries() {
        guard let decodedTeams = [Country].loadData(resource: "countries") else {
            self.errorMessage = "Error while retrieving teams"
            return
        }

        self.countries = decodedTeams.sortedByAlphabet
    }
}


