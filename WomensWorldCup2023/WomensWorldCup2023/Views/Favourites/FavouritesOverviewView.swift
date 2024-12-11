//
//  FavouritesOverviewView.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 15/11/2023.
//

import SwiftData
import SwiftUI

struct FavouritesOverviewView: View {
    @Query private var favouriteStadiums: [Stadium]
    @Query private var favouriteTeams: [Country]
    // TODO: remove this hardcoded data and replace it by accessing the user's data
    private let favouriteMatches: [Match] = [
        Match(
            date: Date(),
            homeTeam: CountryEnum.newZealand,
            awayTeam: CountryEnum.norway,
            score: "1 - 0",
            tournamentStage: .groupStage,
            group: .groupA
        ),
        Match(
            date: Date(),
            homeTeam: CountryEnum.australia,
            awayTeam: CountryEnum.ireland,
            score: "1 - 0",
            tournamentStage: .groupStage,
            group: .groupB
        )
    ]

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                FavouriteTeamsView(teams: favouriteTeams)
                    .cornerRadius(20)
                    .padding([.horizontal, .bottom])

                FavouriteStadiumsView(stadiums: favouriteStadiums)
                    .cornerRadius(20)
                    .padding([.horizontal, .bottom])

                FavouriteMatchesView(matches: favouriteMatches)
                    .cornerRadius(20)
                    .padding([.horizontal, .bottom])
            }
            .background(Color("Yellow"))
            .navigationTitle("Favourites")
            .navigationBarTitleTextColor(Color("Blue"))
        }
    }
}

#Preview {
    FavouritesOverviewView()
}
