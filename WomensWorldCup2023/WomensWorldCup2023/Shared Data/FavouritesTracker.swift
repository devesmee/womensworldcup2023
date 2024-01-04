//
//  FavouritesTracker.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 03/01/2024.
//

import Foundation
import Observation
import SwiftUI

@Observable class FavouritesTracker {
    private let userDefaults = UserDefaults.standard
    private let favouriteStadiumsKey = "favouriteStadiums"
    var stadiums: [Stadium] = []

    init() {
        if let stadiumsData = userDefaults.data(forKey: favouriteStadiumsKey) {
            do {
                self.stadiums = try JSONDecoder().decode([Stadium].self, from: stadiumsData)
            } catch {
                print("Something went wrong when reading data from UserDefaults: \(error.localizedDescription)")
            }
        }
    }

    func toggleFavourite(for stadium: Stadium) {
        if let index = stadiums.firstIndex(where: { $0.name == stadium.name }) {
            stadiums.remove(at: index)
            stadium.isFavourite = false
        } else {
            stadiums.append(stadium)
            stadium.isFavourite = true
        }
    }

    func saveToUserDefaults() {
        do {
            let stadiumsData = try JSONEncoder().encode(stadiums)
            userDefaults.setValue(stadiumsData, forKey: favouriteStadiumsKey)
        } catch {
            print("Something went wrong when saving data to UserDefaults: \(error.localizedDescription)")
        }
    }
}
