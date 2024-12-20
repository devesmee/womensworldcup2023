//
//  ToolbarFavouriteButton.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 15/11/2023.
//

import SwiftUI

struct ToolbarFavouriteButton: View {
    let favouritable: any Favouritable
    let onFavouriteClick: () -> Void

    var body: some View {
        Button(action: {
            onFavouriteClick()
        }, label: {
            Image(systemName: favouritable.favourited ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 28, height: 28)
        })
    }
}

#Preview {
    let exampleMatch = Match(
        abbreviation: "NZLNOR",
        date: Date(),
        homeTeam: CountryEnum.newZealand,
        awayTeam: CountryEnum.norway,
        score: "1 - 0",
        tournamentStage: .groupStage,
        group: .groupA
    )

    let stadium = Stadium(
        name: "Eden Park",
        city: "Auckland",
        latitude: -36.87481208922987,
        longitude: 174.7447541218587,
        matches: [exampleMatch]
    )

    return ToolbarFavouriteButton(favouritable: stadium) {
        print("Favourite Button clicked")
    }
}
