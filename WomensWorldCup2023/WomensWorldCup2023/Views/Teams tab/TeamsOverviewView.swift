//
//  TeamsOverviewView.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 05/07/2023.
//

import SwiftUI

struct TeamsOverviewView: View {
    #if FIREBASE
    @Environment(FirebaseManager.self) private var dataManager
    #else
    @Environment(JSONManager.self) private var dataManager
    #endif
    @State private var path: [Country] = []

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                if let errorMessage = dataManager.countriesErrorMessage {
                    Text(errorMessage)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                } else  {
                    Grid {
                        SwiftUI.Group {
                             if dataManager.countries.count >= 3 {
                                 GridRow(alignment: .top) {
                                     TeamsGridRowView(countries: Array(dataManager.countries[0 ... 2]))
                                 }
                             }
                             if dataManager.countries.count >= 6 {
                                 GridRow(alignment: .top) {
                                     TeamsGridRowView(countries: Array(dataManager.countries[3 ... 5]))
                                 }
                                 .padding(.top)
                             }
                             if dataManager.countries.count >= 9 {
                                 GridRow(alignment: .top) {
                                     TeamsGridRowView(countries: Array(dataManager.countries[6 ... 8]))
                                 }
                                 .padding(.top)
                             }
                             if dataManager.countries.count >= 12 {
                                 GridRow(alignment: .top) {
                                     TeamsGridRowView(countries: Array(dataManager.countries[9 ... 11]))
                                 }
                                 .padding(.top)
                             }
                             if dataManager.countries.count >= 15 {
                                 GridRow(alignment: .top) {
                                     TeamsGridRowView(countries: Array(dataManager.countries[12 ... 14]))
                                 }
                                 .padding(.top)
                             }
                        }
                        SwiftUI.Group {
                             if dataManager.countries.count >= 18 {
                                 GridRow(alignment: .top) {
                                     TeamsGridRowView(countries: Array(dataManager.countries[15 ... 17]))
                                 }
                                 .padding(.top)
                             }
                             if dataManager.countries.count >= 21 {
                                 GridRow(alignment: .top) {
                                     TeamsGridRowView(countries: Array(dataManager.countries[18 ... 20]))
                                 }
                                 .padding(.top)
                             }
                             if dataManager.countries.count >= 24 {
                                 GridRow(alignment: .top) {
                                     TeamsGridRowView(countries: Array(dataManager.countries[21 ... 23]))
                                 }
                                 .padding(.top)
                             }
                             if dataManager.countries.count >= 27 {
                                 GridRow(alignment: .top) {
                                     TeamsGridRowView(countries: Array(dataManager.countries[24 ... 26]))
                                 }
                                 .padding(.top)
                             }
                             if dataManager.countries.count >= 30 {
                                 GridRow(alignment: .top) {
                                     TeamsGridRowView(countries: Array(dataManager.countries[27 ... 29]))
                                 }
                                 .padding(.top)
                             }
                             if dataManager.countries.count >= 32 {
                                 GridRow(alignment: .top) {
                                     TeamsGridRowView(countries: Array(dataManager.countries[30 ... 31]))
                                 }
                                 .padding(.top)
                             }
                         }
                    }
                    .padding([.top, .bottom])
                }
            }
            .navigationDestination(for: Country.self) { team in
                TeamDetailView(team: team)
            }
            .background(Color("Yellow"))
            .navigationTitle("Teams")
            .navigationBarTitleTextColor(Color("Blue"))
        }
    }
}

#Preview {
    TeamsOverviewView()
}
