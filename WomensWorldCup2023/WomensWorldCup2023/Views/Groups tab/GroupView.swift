//
//  GroupView.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 04/08/2023.
//

import SwiftUI

struct GroupView: View {
    let group: Group
    var body: some View {
        Text(group.groupName.fullText())
    }
}
/*
struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}*/
