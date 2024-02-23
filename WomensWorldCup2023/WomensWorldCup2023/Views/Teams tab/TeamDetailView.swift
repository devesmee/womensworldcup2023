//
//  TeamDetailView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 08/01/2024.
//

import SwiftUI

struct TeamDetailView: View {
    @Environment(FavouritesTracker.self) private var favourites
    let team: Country

    var body: some View {
        if favourites.teams.contains(where: { $0.name == team.name }) {
            team.isFavourite = true
        }

        return VStack {
            VStack(alignment: .center) {
                Image(team.name)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                Text(team.name)
                    .fontWeight(.semibold)
                    .font(.title)
            }
            .frame(maxWidth: .infinity)
            Spacer()
        }
        .background(Color("Yellow"))
        .navigationBarTitle("", displayMode: .inline)
        .toolbar {
            ToolbarFavouriteButton(favouritable: team) {
                favourites.toggleFavourite(for: team)
            }
        }
    }
}

#Preview {
    TeamDetailView(team:
        Country(
            country: .ireland,
            matchesPlayed: 3,
            goalDifference: -2,
            points: 1
        )
    )
    .environment(FavouritesTracker())
}
