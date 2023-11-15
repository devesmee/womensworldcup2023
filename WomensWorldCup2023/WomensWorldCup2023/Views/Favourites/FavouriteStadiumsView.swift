//
//  FavouriteStadiumsView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 15/11/2023.
//

import SwiftUI

struct FavouriteStadiumsView: View {
    let stadiums: [Stadium]

    var body: some View {
        VStack {
            VStack {
                ForEach(stadiums, id: \.name) { stadium in
                    NavigationLink(destination: StadiumDetailView(stadium: stadium)) {
                        StadiumRowView(stadium: stadium)
                            .padding([.top, .horizontal])
                    }
                }
            }
            .padding(.bottom)
        }
        .background(Color("Orange"))
    }
}

#Preview {
    let exampleMatch = Match(date: Date(), homeTeam: CountryEnum.newZealand, awayTeam: CountryEnum.norway, score: "? - ?", tournamentStage: .groupStage, group: .a)
    let exampleStadium = Stadium(name: "Eden Park", city: "Auckland", latitude: -36.87481208922987, longitude: 174.7447541218587, matches: [exampleMatch])
    
    return FavouriteStadiumsView(stadiums: [exampleStadium])
}
