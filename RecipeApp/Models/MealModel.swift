//
//  MealModel.swift
//  RecipeApp
//
//  Created by Kary Martinez on 11/5/21.
//

import Foundation

struct MealInfo: Decodable {
    let meals: [Meal]
}

struct Meal: Decodable {
    let id: String
    let name: String
    let thumbnailURL: String
    
    
}
