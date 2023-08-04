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
        ZStack {
            Color("Yellow").ignoresSafeArea()
            VStack {
                ForEach(groups, id: \.groupName) { group in
                    GroupView(group: group)
                }
            }
        }
    }

    init() {
        self.setNavigationTitleColor()
        self.loadGroupsData()
    }

    private func setNavigationTitleColor() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color("Blue"))]
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

struct GroupsOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsOverviewView()
    }
}
