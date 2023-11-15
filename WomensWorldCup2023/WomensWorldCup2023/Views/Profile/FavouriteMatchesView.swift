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
        List(matches, id: \.date) { match in
            MatchListRow(match: match, showDate: true, showTournamentStage: true, backgroundColor: Color("Blue"))
                .listRowBackground(Color("Blue"))
                .listRowSeparator(.hidden)
                .foregroundColor(Color("Yellow"))
        }
        .listStyle(.plain)
        .background(Color("Blue"))
        .scrollDisabled(true)
    }
}

#Preview {
    let exampleMatch = Match(date: Date(), homeTeam: CountryEnum.newZealand, awayTeam: CountryEnum.norway, score: "? - ?", tournamentStage: .groupStage, group: .a)
    
    return FavouriteMatchesView(matches: [exampleMatch])
}
