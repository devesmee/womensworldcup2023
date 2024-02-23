//
//  Stadium.swift
//  WomensWorldCup2023
//
//  Created by Esmee Kluijtmans on 23/06/2023.
//

import Foundation
import CoreLocation
import Observation

@Observable class Stadium: Favouritable, Codable {
    let name: String
    let city: String
    private let latitude: Double
    private let longitude: Double
    var coordinate = CLLocationCoordinate2D()
    let matches: [Match]

    private enum CodingKeys: CodingKey {
        case name, city, latitude, longitude, matches
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        city = try container.decode(String.self, forKey: .city)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        matches = try container.decode([Match].self, forKey: .matches)
        
        super.init()
    }

    init(name: String, city: String, latitude: Double, longitude: Double, matches: [Match]) {
        self.name = name
        self.city = city
        self.latitude = latitude
        self.longitude = longitude
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.matches = matches
        
        super.init()
    }
}
