//
//  FavouritesOverviewView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 15/11/2023.
//

import SwiftUI

struct FavouritesOverviewView: View {
    // TODO: remove this hardcoded data and replace it by accessing the user's data
    private let favouriteTeams: [CountryEnum] = [.england, .germany, .netherlands, .spain, .argentina, .australia, .brazil, .canada]
    private let favouriteStadiums: [Stadium] =
    [Stadium(name: "Eden Park", city: "Auckland", latitude: -36.87481208922987, longitude: 174.7447541218587, matches: [Match(date: Date(), homeTeam: CountryEnum.newZealand, awayTeam: CountryEnum.norway, score: "? - ?", tournamentStage: .groupStage, group: .a)]), Stadium(name: "Stadium Australia", city: "Sydney", latitude: -33.847085508343795, longitude: 151.06340033401548, matches: [Match(date: Date(), homeTeam: CountryEnum.australia, awayTeam: CountryEnum.ireland, score: "? - ?", tournamentStage: .groupStage, group: .b)])]
    private let favouriteMatches: [Match] = [Match(date: Date(), homeTeam: CountryEnum.newZealand, awayTeam: CountryEnum.norway, score: "? - ?", tournamentStage: .groupStage, group: .a), Match(date: Date(), homeTeam: CountryEnum.australia, awayTeam: CountryEnum.ireland, score: "? - ?", tournamentStage: .groupStage, group: .b)]
    
    // TODO: improve UI
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                HStack {
                    Text("Favourite teams")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("Blue"))
                    Spacer()
                }
                .padding(.leading)
                FavouriteTeamsView(teams: favouriteTeams)
                    .cornerRadius(20)
                    .padding([.horizontal, .bottom])
            }
            VStack {
                HStack {
                    Text("Favourite stadiums")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("Blue"))
                    Spacer()
                }
                .padding(.leading)
                FavouriteStadiumsView(stadiums: favouriteStadiums)
                    .cornerRadius(20)
                    .padding([.horizontal, .bottom])
            }
            VStack {
                HStack {
                    Text("Favourite matches")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("Blue"))
                    Spacer()
                }
                .padding(.leading)
                FavouriteMatchesView(matches: favouriteMatches)
                    .cornerRadius(20)
                    .padding([.horizontal, .bottom])
            }
        }
        .background(Color("Yellow"))
        .navigationBarTitle("", displayMode: .inline)
    }
}

#Preview {
    FavouritesOverviewView()
}
