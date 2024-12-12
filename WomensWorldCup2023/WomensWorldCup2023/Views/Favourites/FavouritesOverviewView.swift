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
    @Query private var favouriteMatches: [Match]

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
