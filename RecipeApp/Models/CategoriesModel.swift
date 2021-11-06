//
//  categoriesModel.swift
//  RecipeApp
//
//  Created by Kary Martinez on 11/5/21.
//

import Foundation

struct CategoryList: Codable {
    let categories: [Category]
}

struct Category: Codable , Hashable {
    let id: String
    let name: String
    let thumbnailURL: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case thumbnailURL = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
}

