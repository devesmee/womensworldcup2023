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
    
    var errorMessage: String?

    var countries: [Country] = []
    
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
}

