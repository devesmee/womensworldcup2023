//
//  FavouriteMatchesView.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 15/11/2023.
//

import SwiftUI

struct FavouriteMatchesView: View {
    let matches: [Match]
    @State private var isExpanded = false

    var body: some View {
            VStack(spacing: 0) {
                HStack {
                    Text("Matches")
                        .font(.title2)
                        .bold()
                    Spacer()
                    Button {
                        expandContent()
                    } label: {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(
                                width: 12,
                                height: 18
                            )
                            .rotationEffect(isExpanded ? Angle(degrees: 90) : Angle(degrees: 0))
                            .foregroundColor(Color("Yellow"))
                    }
                }
                .contentShape(Rectangle())
                .padding(.all)
                .onTapGesture {
                    expandContent()
                }
                
                if isExpanded {
                    VStack {
                        if matches.isEmpty {
                            Text("You have no favourite matches yet.")
                        } else {
                            ForEach(matches) { match in
                                NavigationLink(value: match) {
                                    MatchListRow(
                                        match: match,
                                        showDate: true,
                                        showTournamentStage: true,
                                        foregroundColor: Color("Yellow"),
                                        backgroundColor: Color("Blue")
                                    )
                                    .padding([.top, .horizontal])
                                }
                            }
                        }
                    }
                    .padding(.bottom)
                }
            }
            .foregroundColor(Color("Yellow"))
            .background(Color("Blue"))
    }

    private func expandContent() {
        withAnimation {
            isExpanded.toggle()
        }
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

    return FavouriteMatchesView(matches: [exampleMatch])
}
