//
//  MatchListRow.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 23/06/2023.
//

import SwiftUI

struct MatchListRow: View {
    let match: Match
    let showDate: Bool
    let showTournamentStage: Bool
    let foregroundColor: Color
    let backgroundColor: Color

    var body: some View {
            VStack(spacing: 5) {
                if showDate {
                    Text(match.date.dayMonthYear)
                        .font(.callout)
                }
                
                if let groupText = match.group?.fullText() {
                    Text(groupText)
                        .font(.callout.italic())
                }
                if showTournamentStage && match.group == nil {
                    Text(match.tournamentStage.rawValue)
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
            .foregroundColor(foregroundColor)
            .alignmentGuide(.listRowSeparatorLeading) { dimensions in
                dimensions[.leading]
            }
            .alignmentGuide(.listRowSeparatorTrailing) { dimensions in
                dimensions[.trailing]
            }
        .listRowBackground(backgroundColor)
        .buttonStyle(PlainButtonStyle())
        .background(
            NavigationLink("", value: match)
                .opacity(0)
        )
    }
    
    init(
        match: Match,
        showDate: Bool,
        showTournamentStage: Bool,
        foregroundColor: Color = Color("Blue"),
        backgroundColor: Color = Color("Yellow")
    ) {
        self.match = match
        self.showDate = showDate
        self.showTournamentStage = showTournamentStage
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
}

#Preview {
    let exampleMatch = Match(
        abbreviation: "NZLNOR",
        date: Date(),
        homeTeam: CountryEnum.newZealand,
        awayTeam: CountryEnum.norway,
        score: "1 - 0",
        tournamentStage: .groupStage,
        group: .groupA
    )

    return MatchListRow(
        match: exampleMatch,
        showDate: true,
        showTournamentStage: false
    )
}
