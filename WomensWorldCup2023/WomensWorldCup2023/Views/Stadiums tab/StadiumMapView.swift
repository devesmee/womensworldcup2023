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
    @State private var path: [Stadium] = []

    var body: some View {
        NavigationStack(path: $path) {
            ZStack(alignment: .topTrailing) {
                Map(coordinateRegion: $mapRegion, annotationItems: stadiums) { stadium in
                    MapAnnotation(coordinate: stadium.coordinate) {
                        NavigationLink(value: stadium) {
                            Image("logo_rounded")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44, height: 44)
                                .clipShape(Circle())
                        }
                    }
                }
                Button {
                    self.resetMapRegion()
                } label: {
                    Image(systemName: "arrow.counterclockwise.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .padding(10)

            }
            .navigationDestination(for: Stadium.self) { stadium in
                StadiumDetailView(stadium: stadium)
            }
            .navigationTitle("Stadiums")
            .background(Color("Yellow"))
        }
    }

    init() {
        self.setNavigationTitleColor()
        self.loadStadiumData()
    }

    private func setNavigationTitleColor() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color("Blue"))]
    }

    private mutating func loadStadiumData() {
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

    private func resetMapRegion() {
        mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -30, longitude: 146), span: MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70))
    }
}

struct StadiumMapView_Previews: PreviewProvider {
    static var previews: some View {
        StadiumMapView()
    }
}

