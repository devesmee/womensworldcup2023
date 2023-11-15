//
//  StadiumRowView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 15/11/2023.
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
        .foregroundColor(Color("Yellow"))
        .background(Color("Orange"))
    }
}

#Preview {
    let exampleMatch = Match(date: Date(), homeTeam: CountryEnum.newZealand, awayTeam: CountryEnum.norway, score: "? - ?", tournamentStage: .groupStage, group: .a)
    let exampleStadium = Stadium(name: "Eden Park", city: "Auckland", latitude: -36.87481208922987, longitude: 174.7447541218587, matches: [exampleMatch])
    
    return StadiumRowView(stadium: exampleStadium)
}
