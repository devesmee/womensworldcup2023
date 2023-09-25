//
//  TeamsOverviewView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 05/07/2023.
//

import SwiftUI

struct TeamsOverviewView: View {
    private var countries: [CountryEnum] = []

    var body: some View {
        NavigationStack {
            List {
                Grid {
                    SwiftUI.Group {
                        GridRow(alignment: .top) {
                            ForEach(countries[0 ... 2], id: \.rawValue) { country in
                                TeamItemView(country: country)
                            }
                            .padding([.leading, .trailing])
                        }
                        GridRow(alignment: .top) {
                            ForEach(countries[3 ... 5], id: \.rawValue) { country in
                                TeamItemView(country: country)
                            }
                        }
                        .padding(.top)
                        GridRow(alignment: .top) {
                            ForEach(countries[6 ... 8], id: \.rawValue) { country in
                                TeamItemView(country: country)
                            }
                        }
                        .padding(.top)
                        GridRow(alignment: .top) {
                            ForEach(countries[9 ... 11], id: \.rawValue) { country in
                                TeamItemView(country: country)
                            }
                        }
                        .padding(.top)
                        GridRow(alignment: .top) {
                            ForEach(countries[12 ... 14], id: \.rawValue) { country in
                                TeamItemView(country: country)
                            }
                        }
                        .padding(.top)
                    }
                    SwiftUI.Group {
                        GridRow(alignment: .top) {
                            ForEach(countries[15 ... 17], id: \.rawValue) { country in
                                TeamItemView(country: country)
                            }
                        }
                        .padding(.top)
                        GridRow(alignment: .top) {
                            ForEach(countries[18 ... 20], id: \.rawValue) { country in
                                TeamItemView(country: country)
                            }
                        }
                        .padding(.top)
                        GridRow(alignment: .top) {
                            ForEach(countries[20 ... 22], id: \.rawValue) { country in
                                TeamItemView(country: country)
                            }
                        }
                        .padding(.top)
                        GridRow(alignment: .top) {
                            ForEach(countries[23 ... 25], id: \.rawValue) { country in
                                TeamItemView(country: country)
                            }
                        }
                        .padding(.top)
                        GridRow(alignment: .top) {
                            ForEach(countries[26 ... 28], id: \.rawValue) { country in
                                TeamItemView(country: country)
                            }
                        }
                        .padding(.top)
                        GridRow(alignment: .top) {
                            ForEach(countries[29 ... 31], id: \.rawValue) { country in
                                TeamItemView(country: country)
                            }
                        }
                        .padding(.top)
                    }
                }
                .listRowBackground(Color("Yellow"))
                .listRowSeparator(.hidden)
                .padding([.top, .bottom])
            }
            .listStyle(.plain)
            .background(Color("Yellow"))
            .navigationTitle("Teams")
        }
    }

    init() {
        self.setNavigationTitleColour()
        self.loadTeamsData()
    }

    private mutating func loadTeamsData() {
        if let path = Bundle.main.path(forResource: "countries", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decodedCountries = try JSONDecoder().decode([CountryEnum].self, from: data)
                let sortedCountries = decodedCountries.sortedByAlphabet
                self.countries = sortedCountries
                return
            } catch {
                print("Something went wrong when fetching data:")
                print(error.localizedDescription)
            }
        }
    }
}

struct TeamsOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsOverviewView()
    }
}
