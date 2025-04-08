//
//  Stadium.swift
//  WomensWorldCup2023
//
//  Created by devesmee on 23/06/2023.
//

import Foundation
import CoreLocation
import Observation

@Observable class Stadium: Favouritable, Codable {
    private(set) var id = UUID()
    private(set) var name: String
    private(set) var city: String
    var favourited = false
    private var latitude: Double
    private var longitude: Double
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    private(set) var matches: [Match]

    private enum CodingKeys: CodingKey {
        case name, city, latitude, longitude, matches
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        city = try container.decode(String.self, forKey: .city)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        matches = try container.decode([Match].self, forKey: .matches)
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(city, forKey: .city)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
        try container.encode(matches, forKey: .matches)
    }

    init(name: String, city: String, latitude: Double, longitude: Double, matches: [Match]) {
        self.name = name
        self.city = city
        self.latitude = latitude
        self.longitude = longitude
        self.matches = matches
    }

    static func == (lhs: Stadium, rhs: Stadium) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
