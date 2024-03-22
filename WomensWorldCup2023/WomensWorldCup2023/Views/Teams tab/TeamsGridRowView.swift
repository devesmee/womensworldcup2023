//
//  TeamsGridRowView.swift
//  WomensWorldCup2023
// 
//  Created by devesmee on 11/03/2024.
//


import SwiftUI

struct TeamsGridRowView: View {
    let countries: [Country]
    
    var body: some View {
        ForEach(countries) { team in
            NavigationLink(value: team) {
                TeamItemView(countryName: team.name)
            }
            .foregroundColor(.black)
        }
        .padding([.leading, .trailing])
    }
}

#Preview {
    TeamsGridRowView(
        countries: [
            Country(
                country: .ireland,
                matchesPlayed: 3,
                goalDifference: -2,
                points: 1
            ),
            Country(
                country: .spain,
                matchesPlayed: 4,
                goalDifference: 3,
                points: 6
            )
        ]
    )
}
