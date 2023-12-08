//
//  FavouriteMatchesView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 15/11/2023.
//

import SwiftUI

struct FavouriteMatchesView: View {
    let matches: [Match]
    
    var body: some View {
        VStack {
            HStack {
                Text("Matches")
                    .font(.title2)
                    .bold()
                Spacer()
            }
            .padding([.top, .leading])
            VStack {
                ForEach(matches, id: \.date) { match in
                    MatchListRow(match: match, showDate: true, showTournamentStage: true, backgroundColor: Color("Blue"))
                        .padding([.top, .horizontal])
                }
            }
            .padding(.bottom)
        }
        .foregroundColor(Color("Yellow"))
        .background(Color("Blue"))
    }
}

#Preview {
    let exampleMatch = Match(date: Date(), homeTeam: CountryEnum.newZealand, awayTeam: CountryEnum.norway, score: "? - ?", tournamentStage: .groupStage, group: .a)
    
    return FavouriteMatchesView(matches: [exampleMatch])
}
