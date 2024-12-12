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
    
    var errorMessage: String?

    var countries: [Country] = []
    var matches: [Match] = []
    
    func getCountries() {
        databaseReference.child(countriesPath).observeSingleEvent(of: .value, with: { snapshot in
            guard let unsortedCountries = try? snapshot.data(as: [Country].self) else {
                self.errorMessage = "Error while retrieving teams"
                return
            }
            
            self.errorMessage = unsortedCountries.isEmpty ? "No teams found" : nil
            
            self.countries = unsortedCountries.sortedByAlphabet
        }, withCancel: { error in
            print(error.localizedDescription)
            self.errorMessage = "Error while retrieving teams"
        })
    }
    
    func getMatches() {
        databaseReference.child(matchesPath).observeSingleEvent(of: .value, with: { snapshot in
            guard let unsortedMatches = try? snapshot.data(as: [Match].self) else {
                self.errorMessage = "Error while retrieving matches"
                return
            }
            
            self.errorMessage = unsortedMatches.isEmpty ? "No matches found" : nil
            
            self.matches = unsortedMatches.sortedByDate
        }, withCancel: { error in
            print(error.localizedDescription)
            self.errorMessage = "Error while retrieving matches"
        })
    }
}

