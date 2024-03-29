//
//  MatchesTabView.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 05/07/2023.
//

import SwiftUI

struct MatchesOverviewView: View {
    private var matches: [Match] = []
    private var sortedUniqueDates: [Date] = []
    @State private var selectedDate: Date?

    var body: some View {
        NavigationStack {
            VStack {
                DateScrollbarView(dates: sortedUniqueDates, selectedDate: $selectedDate)
                    .padding(.horizontal)
                ScrollViewReader { scrollReader in
                    List {
                        ForEach(sortedUniqueDates, id: \.timeIntervalSince1970) { date in
                            MatchDateSectionView(date: date, matches: matches.forDate( date: date))
                                .id(date)
                                .listRowInsets(EdgeInsets(
                                    top: 0,
                                    leading: 0,
                                    bottom: 0,
                                    trailing: 0))
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .listStyle(.plain)
                    .onChange(of: selectedDate) {
                        withAnimation {
                            scrollReader.scrollTo(selectedDate, anchor: .top)
                        }
                    }
                }
                .background(Color("Yellow"))
            }
            .background(Color("Yellow"))
            .navigationTitle("Matches")
            .navigationBarTitleTextColor(Color("Blue"))
        }
    }

    init() {
        self.loadMatchesData()
    }

    private mutating func loadMatchesData() {
        if let decodedMatches = [Match].loadData(resource: "matches") {
            self.matches = decodedMatches
            self.sortedUniqueDates = self.matches.sortedUniqueDates
            self._selectedDate = State(initialValue: self.sortedUniqueDates.first)
        }
    }
}

#Preview {
    MatchesOverviewView()
}
