//
//  MatchDateSectionView.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 30/08/2023.
//

import SwiftUI

struct MatchDateSectionView: View {
    let date: Date
    let matches: [Match]

    var body: some View {
        HStack {
            Text(date.dayMonthYear)
                .font(.title2)
                .bold()
                .padding(.leading)
                .foregroundColor(Color("Yellow"))
            Spacer()
        }
        .padding(.vertical)
        .background(Color("Pink"))

        ForEach(matches) { match in
                MatchListRow(
                    match: match,
                    showDate: false,
                    showTournamentStage: true
                )
        }
        .padding([.vertical, .horizontal])
    }
}

#Preview {
    MatchDateSectionView(
        date: Date(),
        matches: [
            Match(abbreviation: "ArgAus", date: Date(), homeTeam: .argentina, awayTeam: .australia, score: "1-1", tournamentStage: .final)
        ]
    )
}
