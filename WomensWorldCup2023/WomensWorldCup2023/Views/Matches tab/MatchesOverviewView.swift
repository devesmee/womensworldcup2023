//
//  MatchesTabView.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 05/07/2023.
//

import SwiftUI

struct MatchesOverviewView: View {
    #if FIREBASE
    @Environment(FirebaseManager.self) private var dataManager
    #else
    @Environment(JSONManager.self) private var dataManager
    #endif

    @State private var selectedDate: Date?
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                if let errorMessage = dataManager.matchesErrorMessage {
                    VStack {
                        Text(errorMessage)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                } else {
                    DateScrollbarView(dates: dataManager.matches.sortedUniqueDates, selectedDate: $selectedDate)
                        .padding(.horizontal)
                    ScrollViewReader { scrollReader in
                        List {
                            ForEach(dataManager.matches.sortedUniqueDates, id: \.timeIntervalSince1970) { date in
                                MatchDateSectionView(date: date, matches: dataManager.matches.forDate(date))
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
            }
            .background(Color("Yellow"))
            .navigationTitle("Matches")
            .navigationBarTitleTextColor(Color("Blue"))
            .navigationDestination(for: Match.self) { match in
                MatchDetailView(match: match)
            }
        }
        .onAppear {
            self.selectedDate = dataManager.matches.sortedUniqueDates.first
        }
    }
}

#Preview {
    MatchesOverviewView()
}
