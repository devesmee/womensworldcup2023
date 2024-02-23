//
//  Favouritable.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 03/01/2024.
//

import Foundation
import Observation

@Observable class Favouritable: Identifiable, Hashable {
    let id = UUID()
    var isFavourite = false
    
    static func == (lhs: Favouritable, rhs: Favouritable) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
