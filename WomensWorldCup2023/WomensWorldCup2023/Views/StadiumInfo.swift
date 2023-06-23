//
//  StadiumInfo.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 23/06/2023.
//

import SwiftUI

struct StadiumInfo: View {
    let stadium: Stadium

    var body: some View {
        ZStack(alignment: .bottom) {
            Image(stadium.name)
                .resizable()
                .frame(height: 200)

            Rectangle()
                .fill(Color("Blue").opacity(0.7))
                .frame(height: 55)

            VStack {
                Text(stadium.name)
                    .font(.title3.bold())
                    .foregroundColor(Color("Yellow"))
                Text(stadium.city)
                    .foregroundColor(Color("Yellow"))
            }
            .padding(.bottom, 5)
        }
    }
}

struct StadiumInfo_Previews: PreviewProvider {
    static let exampleMatch = Match(date: "20 July 2023", homeTeam: Countries.newZealand, awayTeam: Countries.norway, score: "? - ?", tournamentStage: .groupStage)
    static let exampleStadium = Stadium(name: "Eden Park", city: "Auckland", latitude: 36.87481208922987, longitude: -174.7447541218587, matches: [exampleMatch])

    static var previews: some View {
        StadiumInfo(stadium: exampleStadium)
    }
}
