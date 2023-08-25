//
//  MatchesTabView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 05/07/2023.
//

import SwiftUI

struct MatchesOverviewView: View {
    private var matches: [Match] = []

    var body: some View {
        ZStack {
            Color("Yellow").ignoresSafeArea()
            Text("Matches")
        }
    }

    init() {
        self.setNavigationTitleColour()
        self.loadMatchesData()
    }

    private mutating func loadMatchesData() {
        if let path = Bundle.main.path(forResource: "matches", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decodedMatches = try JSONDecoder().decode([Match].self, from: data)
                self.matches = decodedMatches.sortedByDate
                return
            } catch {
                print("Something went wrong when fetching data:")
                print(error.localizedDescription)
            }
        }
    }
}

struct MatchesOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesOverviewView()
    }
}
