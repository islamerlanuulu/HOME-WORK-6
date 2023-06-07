//
//  ProductModel.swift
//  tash6.4
//
//  Created by Islam Erlan Uulu on 7/6/23.
//

import Foundation
// MARK: - ProductModel
struct ProductModel: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int?
    let title, description: String?
    let thumbnail: String?
    let brand: String?
    let category: String?
    init(id: Int?, title: String?, description: String? = nil, thumbnail: String? = nil, brand: String? = nil, category: String? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.thumbnail = thumbnail
        self.brand = brand
        self.category = category
    }
}
