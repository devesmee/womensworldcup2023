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
    private let favouriteTeamsKey = "favouriteTeams"
    var stadiums: [Stadium] = []
    var teams: [Country] = []

    init() {
        self.stadiums = loadFromUserDefaults(key: favouriteStadiumsKey, type: [Stadium].self) ?? []
        self.teams = loadFromUserDefaults(key: favouriteTeamsKey, type: [Country].self) ?? []
    }
    
    private func loadFromUserDefaults<T: Decodable>(key: String, type: T.Type) -> T? {
        if let data = userDefaults.data(forKey: key) {
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                print("Something went wrong when reading data from UserDefaults: \(error.localizedDescription)")
                return nil
            }
        } else {
            return nil
        }
    }

    func toggleFavourite(for stadium: Stadium) {
        if let index = stadiums.firstIndex(where: { $0.name == stadium.name }) {
            stadiums.remove(at: index)
        } else {
            stadiums.append(stadium)
        }
        stadium.isFavourite.toggle()
    }
    
    func toggleFavourite(for team: Country) {
        if let index = teams.firstIndex(where: { $0.name == team.name }) {
            teams.remove(at: index)
        } else {
            teams.append(team)
        }
        team.isFavourite.toggle()
    }

    func saveToUserDefaults() {
        do {
            let stadiumsData = try JSONEncoder().encode(stadiums)
            userDefaults.setValue(stadiumsData, forKey: favouriteStadiumsKey)
            let teamsData = try JSONEncoder().encode(teams)
            userDefaults.setValue(teamsData, forKey: favouriteTeamsKey)
        } catch {
            print("Something went wrong when saving data to UserDefaults: \(error.localizedDescription)")
        }
    }
}
