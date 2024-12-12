//
//  StadiumMapView.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 23/06/2023.
//

import SwiftUI
import MapKit

struct StadiumMapView: View {
    #if FIREBASE
    @Environment(FirebaseManager.self) private var dataManager
    #else
    @Environment(JSONManager.self) private var dataManager
    #endif
    @State private var mapPosition = MapCameraPosition.automatic
    @State private var path: [Stadium] = []

    var body: some View {
        NavigationStack(path: $path) {
            ZStack(alignment: .topTrailing) {
                if let errorMessage = dataManager.stadiumsErrorMessage {
                    VStack {
                        Text(errorMessage)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    .background(Color("Yellow"))
                } else {
                    Map(position: $mapPosition) {
                        ForEach(dataManager.stadiums) { stadium in
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
            }
            .navigationDestination(for: Stadium.self) { stadium in
                StadiumDetailView(stadium: stadium)
            }
            .toolbarBackground(Color("Yellow"))
            .navigationTitle("Stadiums")
            .navigationBarTitleTextColor(Color("Blue"))
        }
    }

    private func resetMapRegion() {
        mapPosition = MapCameraPosition.automatic
    }
}

#Preview {
    StadiumMapView()
}
