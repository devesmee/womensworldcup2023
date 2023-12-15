//
//  FavouriteMatchesView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 15/11/2023.
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
                    ForEach(matches, id: \.date) { match in
                        MatchListRow(
                            match: match,
                            showDate: true,
                            showTournamentStage: true,
                            backgroundColor: Color("Blue")
                        )
                        .padding([.top, .horizontal])
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
        date: Date(),
        homeTeam: CountryEnum.newZealand,
        awayTeam: CountryEnum.norway,
        score: "1 - 0",
        tournamentStage: .groupStage,
        group: .groupA
    )

    return FavouriteMatchesView(matches: [exampleMatch])
}
