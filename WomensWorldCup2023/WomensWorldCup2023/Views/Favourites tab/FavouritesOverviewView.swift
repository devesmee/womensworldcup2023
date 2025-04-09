//
//  FavouritesOverviewView.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 15/11/2023.
//

import SwiftUI

struct FavouritesOverviewView: View {
    @AppStorage("favouriteTeams") var favouriteTeams = [Country]()
    @AppStorage("favouriteStadiums") var favouriteStadiums = [Stadium]()
    @AppStorage("favouriteMatches") var favouriteMatches = [Match]()
    
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
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
            .navigationDestination(for: Country.self) { country in
                TeamDetailView(team: country)
            }
            .navigationDestination(for: Stadium.self) { stadium in
                StadiumDetailView(stadium: stadium)
            }
            .navigationDestination(for: Match.self) { match in
                MatchDetailView(match: match)
            }
        }
    }
}

#Preview {
    FavouritesOverviewView()
}
