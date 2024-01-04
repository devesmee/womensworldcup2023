//
//  FavouriteStadiumsView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 15/11/2023.
//

import SwiftUI

struct FavouriteStadiumsView: View {
    let stadiums: [Stadium]
    @State private var isExpanded = false

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Stadiums")
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
                    if stadiums.isEmpty {
                        Text("You have no favourite stadiums yet.")
                    } else {
                        ForEach(stadiums, id: \.name) { stadium in
                            NavigationLink(destination: StadiumDetailView(stadium: stadium)) {
                                StadiumRowView(stadium: stadium)
                                    .padding([.top, .horizontal])
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .foregroundColor(Color("Yellow"))
        .background(Color("Orange"))
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
    let exampleStadium = Stadium(
        name: "Eden Park",
        city: "Auckland",
        latitude: -36.87481208922987,
        longitude: 174.7447541218587,
        matches: [exampleMatch]
    )

    return FavouriteStadiumsView(stadiums: [exampleStadium])
}
