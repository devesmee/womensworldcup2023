//
//  StadiumMapView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 23/06/2023.
//

import SwiftUI
import MapKit

struct StadiumMapView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -30, longitude: 146), span: MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70))
    private var stadiums: [Stadium] = []

    var body: some View {
        NavigationView {
            Map(coordinateRegion: $mapRegion, annotationItems: stadiums) { stadium in
                MapAnnotation(coordinate: stadium.coordinate) {
                    NavigationLink(destination: StadiumDetailView(stadium: stadium)) {
                        Image("logo_rounded")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44, height: 44)
                            .clipShape(Circle())
                    }
                }
            }
            .navigationTitle("Stadium explorer")
            .background(Color("Yellow"))
        }
    }

    init() {
        if let path = Bundle.main.path(forResource: "stadiums", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decodedData = try JSONDecoder().decode([Stadium].self, from: data)
                self.stadiums = decodedData
                return
            } catch {
                print("Something went wrong when fetching data:")
                print(error.localizedDescription)
            }
        }
    }
}

struct StadiumMapView_Previews: PreviewProvider {
    static var previews: some View {
        StadiumMapView()
    }
}

