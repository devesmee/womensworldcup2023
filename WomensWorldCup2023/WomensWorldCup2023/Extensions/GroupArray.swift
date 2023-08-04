//
//  GroupArray.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 04/08/2023.
//

import Foundation

extension Array where Element == Group {
    var sortedByAlphabet: [Group] {
        self.sorted { $0.groupName.fullText() < $1.groupName.fullText() }
    }
}
