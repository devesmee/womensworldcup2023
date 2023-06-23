//
//  MatchListRow.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 23/06/2023.
//

import SwiftUI

struct MatchListRow: View {
    let match: Match

    var body: some View {
        VStack(spacing: 0) {
            Text(match.date)
                .font(.callout.italic())
            ZStack {
                HStack {
                    Spacer()
                    Text(match.score)
                        .fontWeight(.semibold)
                    Spacer()
                }
                HStack {
                    Image(match.homeTeam.rawValue)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                    Text(match.homeTeam.rawValue)
                        .fontWeight(.semibold)
                        .frame(width: 100, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Text(match.awayTeam.rawValue)
                        .fontWeight(.semibold)
                        .frame(width: 100, alignment: .trailing)
                        .multilineTextAlignment(.trailing)
                    Image(match.awayTeam.rawValue)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                }
                .lineLimit(2)
                .lineSpacing(0)
            }
        }
        .listRowBackground(Color("Yellow"))
    }
}

struct MatchListRow_Previews: PreviewProvider {
    static let exampleMatch = Match(date: "20 July 2023", homeTeam: Countries.newZealand, awayTeam: Countries.norway, score: "? - ?", tournamentStage: .groupStage)

    static var previews: some View {
        MatchListRow(match: exampleMatch)
    }
}
