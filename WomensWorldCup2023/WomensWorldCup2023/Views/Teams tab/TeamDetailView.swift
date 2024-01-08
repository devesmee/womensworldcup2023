//
//  TeamDetailView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 08/01/2024.
//

import SwiftUI

struct TeamDetailView: View {
    let team: Country

    var body: some View {
        VStack {
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
        // TODO: add toolbar to favourite a team
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
