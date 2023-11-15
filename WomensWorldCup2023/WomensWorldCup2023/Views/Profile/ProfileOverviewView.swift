//
//  ProfileOverview.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 15/11/2023.
//

import SwiftUI

struct ProfileOverviewView: View {
    // TODO: remove this hardcoded data and replace it by accessing the user's data
    private let favouriteTeams: [CountryEnum] = [.england, .germany, .netherlands, .spain, .argentina, .australia, .brazil, .canada]
    private let favouriteStadiums: [Stadium] =
    [Stadium(name: "Eden Park", city: "Auckland", latitude: -36.87481208922987, longitude: 174.7447541218587, matches: [Match(date: Date(), homeTeam: CountryEnum.newZealand, awayTeam: CountryEnum.norway, score: "? - ?", tournamentStage: .groupStage, group: .a)])]
    private let favouriteMatches: [Match] = [Match(date: Date(), homeTeam: CountryEnum.newZealand, awayTeam: CountryEnum.norway, score: "? - ?", tournamentStage: .groupStage, group: .a)]
    
    // TODO: refactor to using ScrollView / ForEach
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Your favourite teams")
                    Spacer()
                }
                .padding(.leading)
                FavouriteTeamsView(teams: favouriteTeams)
                    .cornerRadius(20)
                    .padding()
            }
            VStack {
                HStack {
                    Text("Your favourite stadiums")
                    Spacer()
                }
                .padding(.leading)
                FavouriteStadiumsView(stadiums: favouriteStadiums)
                    .cornerRadius(20)
                    .padding()
            }
            VStack {
                HStack {
                    Text("Your favourite matches")
                    Spacer()
                }
                .padding(.leading)
                FavouriteMatchesView(matches: favouriteMatches)
                    .cornerRadius(20)
                    .padding(20)
            }
        }
        .background(Color("Yellow"))
    }
}

#Preview {
    ProfileOverviewView()
}
