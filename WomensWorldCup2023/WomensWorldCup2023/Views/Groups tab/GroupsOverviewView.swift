//
//  GroupsOverviewView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 05/07/2023.
//

import SwiftUI

struct GroupsOverviewView: View {
    private var groups: [Group] = []

    var body: some View {
        NavigationStack {
            List(groups, id: \.groupName) { group in
                GroupView(group: group)
                    .cornerRadius(20)
                    .listRowBackground(Color("Yellow"))
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .background(Color("Yellow"))
            .navigationTitle("Groups")
            .toolbar {
                ToolbarFavouritesButtonView()
            }
        }
    }

    init() {
        self.setNavigationTitleColour()
        self.loadGroupsData()
    }

    private mutating func loadGroupsData() {
        if let path = Bundle.main.path(forResource: "groups", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decodedGroups = try JSONDecoder().decode([Group].self, from: data)
                let sortedGroups = decodedGroups.sortedByAlphabet
                self.groups = sortedGroups
                return
            } catch {
                print("Something went wrong when fetching data:")
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    GroupsOverviewView()
}
