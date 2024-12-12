//
//  MatchDetailView.swift
//  WomensWorldCup2023
// 
//  Created by devesmee on 12/12/2024.
//

import SwiftData
import SwiftUI

struct MatchDetailView: View {
    @Environment(\.modelContext) private var context
    @Query private var favouriteMatches: [Match]
    let match: Match

    var body: some View {
        if favouriteMatches.contains(where: { $0.abbreviation == match.abbreviation }) {
            match.favourited = true
        }

        return VStack {
            MatchListRow(
                match: match,
                showDate: true,
                showTournamentStage: true,
                backgroundColor: Color("Yellow")
            )
            Spacer()
        }
        .padding(.horizontal)
        .background(Color("Yellow"))
        .navigationBarTitle("", displayMode: .inline)
        .toolbar {
            ToolbarFavouriteButton(favouritable: match) {
                match.favourited.toggle()
                if favouriteMatches.firstIndex(where: { $0.abbreviation == match.abbreviation }) != nil {
                    context.delete(match)
                } else {
                    context.insert(match)
                }
                try? context.save()
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

