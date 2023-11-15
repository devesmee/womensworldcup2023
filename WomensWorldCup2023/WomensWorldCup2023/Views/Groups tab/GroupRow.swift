//
//  GroupRow.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 04/08/2023.
//

import SwiftUI

struct GroupRow: View {
    let team: Country
    let finishedPosition: Int
    var body: some View {
        GridRow {
            Rectangle()
                .frame(width: 5, height: 25)
                .foregroundColor(
                    finishedPosition <= 2 ? Color("Pink") : .clear
                )
            Text("\(finishedPosition)")
                .bold()
            Image(team.country.name)
                .resizable()
                .scaledToFill()
                .frame(width: 35, height: 35)
                .clipShape(Circle())
            Text(team.country.name)
                .bold()
                .frame(width: 160, alignment: .leading)
            Text("\(team.matchesPlayed)")
            Text("\(team.goalDifference)")
            Text("\(team.points)")
                .bold()
        }
    }
}

#Preview {
    let exampleTeam = Country(
        country: .newZealand,
        matchesPlayed: 3,
        goalDifference: 0,
        points: 4
    )
    
    return GroupRow(team: exampleTeam, finishedPosition: 3)
}
