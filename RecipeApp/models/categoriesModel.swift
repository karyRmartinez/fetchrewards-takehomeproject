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

struct Category: Codable {
    let idCategory, strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}
