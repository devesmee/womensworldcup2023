//
//  FavouriteTeamsView.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 15/11/2023.
//

import SwiftUI

struct FavouriteTeamsView: View {
    let teams: [Country]
    @State private var isExpanded = false

    var body: some View {
            VStack(spacing: 0) {
                HStack {
                    Text("Teams")
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
                        if teams.isEmpty {
                            Text("You have no favourite teams yet.")
                        } else {
                            ForEach(teams, id: \.id) { team in
                                NavigationLink(value: team) {
                                    TeamRowView(team: team.country)
                                        .padding([.top, .leading])
                                }
                            }
                        }
                    }
                    .padding(.bottom)
                }
            }
            .foregroundColor(Color("Yellow"))
            .background(Color("Green"))
    }

    private func expandContent() {
        withAnimation {
            isExpanded.toggle()
        }
    }
}

#Preview {
    let teams = [
        Country(country: .england, matchesPlayed: 3, goalDifference: 7, points: 9),
        Country(country: .netherlands, matchesPlayed: 3, goalDifference: 8, points: 7),
        Country(country: .spain, matchesPlayed: 3, goalDifference: 4, points: 6)
    ]

    return FavouriteTeamsView(teams: teams)
}
