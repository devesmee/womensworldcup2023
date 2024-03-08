//
//  StadiumMapView.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 23/06/2023.
//

import SwiftUI
import MapKit

struct StadiumMapView: View {
    @State private var mapPosition = MapCameraPosition.automatic
    private var stadiums: [Stadium] = []
    @State private var path: [Stadium] = []

    var body: some View {
        NavigationStack(path: $path) {
            ZStack(alignment: .topTrailing) {
                Map(position: $mapPosition) {
                    ForEach(stadiums) { stadium in
                        Annotation(stadium.name, coordinate: stadium.coordinate) {
                            NavigationLink(value: stadium) {
                                Image("logo_rounded")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 44, height: 44)
                                    .clipShape(Circle())
                            }
                        }
                    }
                }
                Button {
                    self.resetMapRegion()
                } label: {
                    Image(systemName: "arrow.counterclockwise.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color("Orange"))
                        .background(Color("Blue"))
                }
                .clipShape(Circle())
                .padding(10)
            }
            .navigationDestination(for: Stadium.self) { stadium in
                StadiumDetailView(stadium: stadium)
            }
            .toolbarBackground(Color("Yellow"))
            .navigationTitle("Stadiums")
            .navigationBarTitleTextColor(Color("Blue"))
        }
    }
    
    init() {
        self.loadStadiumData()
    }
    
    private mutating func loadStadiumData() {
        if let decodedStadiums = [Stadium].loadData(resource: "stadiums") {
            self.stadiums = decodedStadiums
        }
    }
    
    private func resetMapRegion() {
        mapPosition = MapCameraPosition.automatic
    }
}

#Preview {
    StadiumMapView()
}
