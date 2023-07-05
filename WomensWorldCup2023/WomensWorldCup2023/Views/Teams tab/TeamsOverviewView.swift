//
//  TeamsOverviewView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 05/07/2023.
//

import SwiftUI

struct TeamsOverviewView: View {
    private var countries: [Country] = []

    var body: some View {
        ZStack {
            Color("Yellow").ignoresSafeArea()

            Grid {
                GridRow {
                    ForEach(countries[0 ... 3], id: \.rawValue) { country in
                        TeamItemView(country: country)
                    }
                }
                GridRow {
                    ForEach(countries[4 ... 7], id: \.rawValue) { country in
                        TeamItemView(country: country)
                    }
                }
                GridRow {
                    ForEach(countries[8 ... 11], id: \.rawValue) { country in
                        TeamItemView(country: country)
                    }
                }
                GridRow {
                    ForEach(countries[12 ... 15], id: \.rawValue) { country in
                        TeamItemView(country: country)
                    }
                }
                GridRow {
                    ForEach(countries[16 ... 19], id: \.rawValue) { country in
                        TeamItemView(country: country)
                    }
                }
                GridRow {
                    ForEach(countries[20 ... 23], id: \.rawValue) { country in
                        TeamItemView(country: country)
                    }
                }
                GridRow {
                    ForEach(countries[24 ... 27], id: \.rawValue) { country in
                        TeamItemView(country: country)
                    }
                }
                GridRow {
                    ForEach(countries[28 ... 31], id: \.rawValue) { country in
                        TeamItemView(country: country)
                    }
                }
            }
        }
        .navigationTitle("Teams")
    }

    init() {
        self.setNavigationTitleColor()
        self.loadTeamsData()
    }

    private func setNavigationTitleColor() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color("Blue"))]
    }

    private mutating func loadTeamsData() {
        if let path = Bundle.main.path(forResource: "countries", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decodedCountries = try JSONDecoder().decode(Countries.self, from: data)
                let sortedCountries = decodedCountries.countries.sortedByAlphabet
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
