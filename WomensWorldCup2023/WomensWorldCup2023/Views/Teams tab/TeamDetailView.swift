//
//  TeamDetailView.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 08/01/2024.
//

import SwiftData
import SwiftUI

struct TeamDetailView: View {
    @Environment(\.modelContext) private var context
    @Query private var favouriteTeams: [Country]
    let team: Country

    var body: some View {
        if favouriteTeams.contains(where: { $0.name == team.name }) {
            team.favourited = true
        }

        return VStack {
            VStack(alignment: .center) {
                Image(team.name)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                Text(team.name)
                    .fontWeight(.semibold)
                    .font(.title)
            }
            .frame(maxWidth: .infinity)
            Spacer()
        }
        .background(Color("Yellow"))
        .navigationBarTitle("", displayMode: .inline)
        .toolbar {
            ToolbarFavouriteButton(favouritable: team) {
                team.favourited.toggle()
                if favouriteTeams.firstIndex(where: { $0.name == team.name }) != nil {
                    context.delete(team)
                } else {
                    context.insert(team)
                }
            }
        }
    }
}

#Preview {
    TeamDetailView(team:
        Country(
            country: .ireland,
            matchesPlayed: 3,
            goalDifference: -2,
            points: 1
        )
    )
}
