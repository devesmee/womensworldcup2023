//
//  MatchDetailView.swift
//  WomensWorldCup2023
// 
//  Created by devesmee on 12/12/2024.
//

import SwiftUI

struct MatchDetailView: View {
    @AppStorage("favouriteMatches") var favouriteMatches = [Match]()
    let match: Match

    var body: some View {
        if favouriteMatches.contains(where: { $0.abbreviation == match.abbreviation }) {
            match.favourited = true
        }

        return VStack {
            MatchListRow(
                match: match,
                showDate: true,
                showTournamentStage: true
            )
            Spacer()
        }
        .padding(.horizontal)
        .foregroundColor(.black)
        .background(Color("Yellow"))
        .navigationBarTitle("", displayMode: .inline)
        .toolbar {
            ToolbarFavouriteButton(favouritable: match) {
                match.favourited.toggle()
                if let index = favouriteMatches.firstIndex(where: { $0.abbreviation == match.abbreviation }) {
                    favouriteMatches.remove(at: index)
                } else {
                    favouriteMatches.append(match)
                }
            }
        }
    }
}

#Preview {
    MatchDetailView(match:
        Match(
            abbreviation: "ArgAus",
            date: Date(),
            homeTeam: .argentina,
            awayTeam: .australia,
            score: "1-1",
            tournamentStage: .final
        )
    )
}

