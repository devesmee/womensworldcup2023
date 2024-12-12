//
//  Favouritable.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 03/01/2024.
//

import Foundation

protocol Favouritable: Identifiable, Hashable {
    var id: UUID { get }
    var favourited: Bool { get }

    static func == (lhs: Self, rhs: Self) -> Bool
}
