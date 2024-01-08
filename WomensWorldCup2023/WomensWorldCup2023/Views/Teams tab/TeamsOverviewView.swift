//
//  TeamsOverviewView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 05/07/2023.
//

import SwiftUI

struct TeamsOverviewView: View {
    private var countries: [Country] = []
    @State private var path: [Country] = []

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                 Grid {
                    SwiftUI.Group {
                        GridRow(alignment: .top) {
                            ForEach(countries[0 ... 2]) { team in
                                NavigationLink(value: team) {
                                    TeamItemView(countryName: team.name)
                                }
                                .foregroundColor(.black)
                            }
                            .padding([.leading, .trailing])
                        }
                        GridRow(alignment: .top) {
                            ForEach(countries[3 ... 5]) { team in
                                NavigationLink(value: team) {
                                    TeamItemView(countryName: team.name)
                                }
                                .foregroundColor(.black)
                            }
                        }
                        .padding(.top)
                        GridRow(alignment: .top) {
                            ForEach(countries[6 ... 8]) { team in
                                NavigationLink(value: team) {
                                    TeamItemView(countryName: team.name)
                                }
                                .foregroundColor(.black)
                            }
                        }
                        .padding(.top)
                        GridRow(alignment: .top) {
                            ForEach(countries[9 ... 11]) { team in
                                NavigationLink(value: team) {
                                    TeamItemView(countryName: team.name)
                                }
                                .foregroundColor(.black)
                            }
                        }
                        .padding(.top)
                        GridRow(alignment: .top) {
                            ForEach(countries[12 ... 14]) { team in
                                NavigationLink(value: team) {
                                    TeamItemView(countryName: team.name)
                                }
                                .foregroundColor(.black)
                            }
                        }
                        .padding(.top)
                    }
                    SwiftUI.Group {
                        GridRow(alignment: .top) {
                            ForEach(countries[15 ... 17]) { team in
                                NavigationLink(value: team) {
                                    TeamItemView(countryName: team.name)
                                }
                                .foregroundColor(.black)
                            }
                        }
                        .padding(.top)
                        GridRow(alignment: .top) {
                            ForEach(countries[18 ... 20]) { team in
                                NavigationLink(value: team) {
                                    TeamItemView(countryName: team.name)
                                }
                                .foregroundColor(.black)
                            }
                        }
                        .padding(.top)
                        GridRow(alignment: .top) {
                            ForEach(countries[21 ... 23]) { team in
                                NavigationLink(value: team) {
                                    TeamItemView(countryName: team.name)
                                }
                                .foregroundColor(.black)
                            }
                        }
                        .padding(.top)
                        GridRow(alignment: .top) {
                            ForEach(countries[24 ... 26]) { team in
                                NavigationLink(value: team) {
                                    TeamItemView(countryName: team.name)
                                }
                                .foregroundColor(.black)
                            }
                        }
                        .padding(.top)
                        GridRow(alignment: .top) {
                            ForEach(countries[27 ... 29]) { team in
                                NavigationLink(value: team) {
                                    TeamItemView(countryName: team.name)
                                }
                                .foregroundColor(.black)
                            }
                        }
                        .padding(.top)
                        GridRow(alignment: .top) {
                            ForEach(countries[30 ... 31]) { team in
                                NavigationLink(value: team) {
                                    TeamItemView(countryName: team.name)
                                }
                                .foregroundColor(.black)
                            }
                        }
                        .padding(.top)
                    }
                }
                .padding([.top, .bottom])
            }
            .navigationDestination(for: Country.self) { team in
                TeamDetailView(team: team)
            }
            .background(Color("Yellow"))
            .navigationTitle("Teams")
            .navigationBarTitleTextColor(Color("Blue"))
        }
    }

    init() {
        self.loadTeamsData()
    }

    private mutating func loadTeamsData() {
        if let decodedTeams = [Country].loadData(resource: "countries") {
            self.countries = decodedTeams.sortedByAlphabet
        }
    }
}

#Preview {
    TeamsOverviewView()
}
