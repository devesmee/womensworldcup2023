//
//  FirebaseManager.swift
//  WomensWorldCup2023
// 
//  Created by devesmee on 08/03/2024.
//


import Foundation
import FirebaseDatabase

@Observable class FirebaseManager: DataManager {
    private let databaseReference = Database.database().reference()

    private let countriesPath = "countries"
    private let matchesPath = "matches"
    
    var countriesErrorMessage: String?
    var matchesErrorMessage: String?

    var countries: [Country] = []
    var matches: [Match] = []
    
    func getCountries() {
        databaseReference.child(countriesPath).observeSingleEvent(of: .value, with: { snapshot in
            guard let unsortedCountries = try? snapshot.data(as: [Country].self) else {
                self.countriesErrorMessage = "Could not retrieve teams, please try again later"
                return
            }
            
            self.countriesErrorMessage = unsortedCountries.isEmpty ? "No teams found" : nil
            
            self.countries = unsortedCountries.sortedByAlphabet
        }, withCancel: { error in
            print(error.localizedDescription)
            self.countriesErrorMessage = "Could not retrieve teams, please try again later"
        })
    }
    
    func getMatches() {
        databaseReference.child(matchesPath).observeSingleEvent(of: .value, with: { snapshot in
            guard let unsortedMatches = try? snapshot.data(as: [Match].self) else {
                self.matchesErrorMessage = "Could not retrieve matches, please try again later"
                return
            }
            
            self.matchesErrorMessage = unsortedMatches.isEmpty ? "No matches found" : nil
            
            self.matches = unsortedMatches.sortedByDate
        }, withCancel: { error in
            print(error.localizedDescription)
            self.matchesErrorMessage = "Could not retrieve matches, please try again later"
        })
    }
}

