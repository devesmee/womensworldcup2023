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
        VStack(spacing: 5) {
            Text(match.date)
                .font(.callout)
            if let groupText = match.group?.fullText() {
                Text(groupText)
                    .font(.callout.italic())
            }
            ZStack {
                HStack {
                    Spacer()
                    Text(match.score)
                        .fontWeight(.semibold)
                    Spacer()
                }
                HStack {
                    Image(match.homeTeam.name)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                    Text(match.homeTeam.name)
                        .fontWeight(.semibold)
                        .frame(width: 100, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Text(match.awayTeam.name)
                        .fontWeight(.semibold)
                        .frame(width: 100, alignment: .trailing)
                        .multilineTextAlignment(.trailing)
                    Image(match.awayTeam.name)
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
        .alignmentGuide(.listRowSeparatorLeading) { dimensions in
            dimensions[.leading]
        }
        .alignmentGuide(.listRowSeparatorTrailing) { dimensions in
            dimensions[.trailing]
        }
    }
}

struct MatchListRow_Previews: PreviewProvider {
    static let exampleMatch = Match(date: "20 July 2023", homeTeam: CountryEnum.newZealand, awayTeam: CountryEnum.norway, score: "? - ?", tournamentStage: .groupStage, group: .a)

    static var previews: some View {
        MatchListRow(match: exampleMatch)
    }
}
