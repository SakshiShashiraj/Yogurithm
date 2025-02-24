//
//  Yogurt.swift
//  Yogurithm
//
//  Created by Sakshi Shashiraj on 2/23/25.
//

import SwiftData
import Foundation

@Model // This makes it a SwiftData model
class Yogurt {
    var name: String
    var brand: String
    var rating: Int
    var review: String?
    var dateAdded: Date

    init(name: String, brand: String, rating: Int, review: String? = nil) {
        self.name = name
        self.brand = brand
        self.rating = rating
        self.review = review
        self.dateAdded = Date()
    }
}
