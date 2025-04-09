//
//  StadiumRowView.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 15/11/2023.
//

import SwiftUI

struct StadiumRowView: View {
    let stadium: Stadium

    var body: some View {
        HStack {
            HStack {
                Image(stadium.name)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                Text(stadium.name)
                    .bold()
            }
            Spacer()
            HStack {
                Image(systemName: "pin.fill")
                Text(stadium.city)
                    .bold()
            }
        }
        .background(Color("Orange"))
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
    let exampleStadium = Stadium(
        name: "Eden Park",
        city: "Auckland",
        latitude: -36.87481208922987,
        longitude: 174.7447541218587,
        matches: [exampleMatch]
    )

    return StadiumRowView(stadium: exampleStadium)
}
