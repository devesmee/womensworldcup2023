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
    var groupsErrorMessage: String?
    
    var countries = [Country]()
    var matches = [Match]()
    var stadiums = [Stadium]()
    var groups = [Group]()
    
    func getData() {
        getCountries()
        getMatches()
        getStadiums()
        getGroups()
    }
    
    private func getCountries() {
        guard let decodedTeams = [Country].loadData(resource: countriesPath) else {
            self.countriesErrorMessage = "Could not retrieve teams, please try again later"
            return
        }

        self.countries = decodedTeams.sortedByAlphabet
    }
    
    private func getMatches() {
        guard let decodedMatches = [Match].loadData(resource: matchesPath) else {
            self.matchesErrorMessage = "Could not retrieve matches, please try again later"
            return
        }

        self.matches = decodedMatches.sortedByDate
    }
    
    private func getStadiums() {
        guard let decodedStadiums = [Stadium].loadData(resource: stadiumsPath) else {
            self.stadiumsErrorMessage = "Could not retrieve stadiums, please try again later"
            return
        }

        self.stadiums = decodedStadiums
    }
    
    private func getGroups() {
        guard let decodedGroups = [Group].loadData(resource: groupsPath) else {
            self.groupsErrorMessage = "Could not retrieve groups, please try again later"
            return
        }

        self.groups = decodedGroups.sortedByAlphabet
    }
}


