//
//  StadiumInfo.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 23/06/2023.
//

import SwiftUI
import MapKit

struct StadiumInfo: View {
    let stadium: Stadium

    var body: some View {
        ZStack(alignment: .bottom) {

            ZStack(alignment: .topTrailing) {
                Image(stadium.name)
                    .resizable()
                    .frame(height: 200)

                Button {
                    self.generateCarRoute()
                } label: {
                    Image(systemName: "car.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color("Orange"))
                        .background(Color("Blue"))
                }
                .clipShape(Circle())
                .padding(10)
            }

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

    private func generateCarRoute() {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: stadium.coordinate, addressDictionary: nil))
        mapItem.name = stadium.name
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
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
        latitude: 36.87481208922987,
        longitude: -174.7447541218587,
        matches: [exampleMatch]
    )

   return StadiumInfo(stadium: exampleStadium)
}
