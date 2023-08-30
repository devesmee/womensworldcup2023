//
//  MatchesTabView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 05/07/2023.
//

import SwiftUI

struct MatchesOverviewView: View {
    private var matches: [Match] = []
    private var sortedUniqueDates: [Date] = []
    @State private var selectedDate: Date?

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    DateScrollbarView(dates: sortedUniqueDates, selectedDate: $selectedDate)
                        .padding(.horizontal)
                    ScrollViewReader { scrollReader in
                        ScrollView {
                            VStack(spacing: 25) {
                                Color("Yellow").ignoresSafeArea()
                                ForEach(sortedUniqueDates, id: \.timeIntervalSince1970) { date in
                                    MatchDateSectionView(date: date, matches: matches.forDate( date: date))
                                    .id(date)
                                }
                            }
                        }
                        .onChange(of: selectedDate) { _ in
                            scrollReader.scrollTo(selectedDate, anchor: .top)
                        }
                    }
                }
            }
            .background(Color("Yellow"))
            .navigationTitle("Matches")
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
                self.sortedUniqueDates = self.matches.sortedUniqueDates
                self._selectedDate = State(initialValue: self.sortedUniqueDates.first)
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
