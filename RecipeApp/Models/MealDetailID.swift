//
//  MealDetailID.swift
//  RecipeApp
//
//  Created by Kary Martinez on 11/5/21.
//

import Foundation

struct MealIDInfo: Decodable {
    let meals: [MealDetails]
}

struct MealDetails: Decodable, Hashable {
    let id: String
    let name: String
    let instructions: String?
    let ingredient1: String?
    let ingredient2: String?
    let ingredient3: String?
    let ingredient4: String?
    let ingredient5: String?
    let ingredient6: String?
    let ingredient7: String?
    let ingredient8: String?
    let ingredient9: String?
    let ingredient10: String?
    let ingredient11: String?
    let ingredient12: String?
    let ingredient13: String?
    let ingredient14: String?
    let ingredient15: String?
    let ingredient16: String?
    let ingredient17: String?
    let ingredient18: String?
    let ingredient19: String?
    let ingredient20: String?
    let measure1: String?
    let measure2: String?
    let measure3: String?
    let measure4: String?
    let measure5: String?
    let measure6: String?
    let measure7: String?
    let measure8: String?
    let measure9: String?
    let measure10: String?
    let measure11: String?
    let measure12: String?
    let measure13: String?
    let measure14: String?
    let measure15: String?
    let measure16: String?
    let measure17: String?
    let measure18: String?
    let measure19: String?
    let measure20: String?
    
    var mealDetails: [String] {
        var result = [String]()
        
        result.append("\(name)")
        
        if measure1 != nil && ingredient1 != nil {
            result.append("\(String(describing: measure1!)) \(String(describing: ingredient1!))")
        }
        
        if measure2 != nil && ingredient2 != nil {
            result.append("\(String(describing: measure2!)) \(String(describing: ingredient2!))")
        }
        
        if measure3 != nil && ingredient3 != nil {
            result.append("\(String(describing: measure3!)) \(String(describing: ingredient3!))")
        }
        
        if measure4 != nil && ingredient4 != nil {
            result.append("\(String(describing: measure4!)) \(String(describing: ingredient4!))")
        }
        
        if measure5 != nil && ingredient5 != nil {
            result.append("\(String(describing: measure5!)) \(String(describing: ingredient5!))")
        }
        
        if measure6 != nil && ingredient6 != nil {
            result.append("\(String(describing: measure6!)) \(String(describing: ingredient6!))")
        }
        
        if measure7 != nil && ingredient7 != nil {
            result.append("\(String(describing: measure7!)) \(String(describing: ingredient7!))")
        }
        
        if measure8 != nil && ingredient8 != nil {
            result.append("\(String(describing: measure8!)) \(String(describing: ingredient8!))")
        }
        
        if measure9 != nil && ingredient9 != nil {
            result.append("\(String(describing: measure9!)) \(String(describing: ingredient9!))")
        }
        
        if measure10 != nil && ingredient10 != nil {
            result.append("\(String(describing: measure10!)) \(String(describing: ingredient10!))")
        }
        
        if measure11 != nil && ingredient11 != nil {
            result.append("\(String(describing: measure11!)) \(String(describing: ingredient11!))")
        }
        
        if measure12 != nil && ingredient12 != nil {
            result.append("\(String(describing: measure12!)) \(String(describing: ingredient12!))")
        }
        
        if measure13 != nil && ingredient13 != nil {
            result.append("\(String(describing: measure13!)) \(String(describing: ingredient13!))")
        }
        
        if measure14 != nil && ingredient14 != nil {
            result.append("\(String(describing: measure14!)) \(String(describing: ingredient14!))")
        }
        
        if measure15 != nil && ingredient15 != nil {
            result.append("\(String(describing: measure15!)) \(String(describing: ingredient15!))")
        }
        
        if measure16 != nil && ingredient16 != nil {
            result.append("\(String(describing: measure16!)) \(String(describing: ingredient16!))")
        }
        
        if measure17 != nil && ingredient17 != nil {
            result.append("\(String(describing: measure17!)) \(String(describing: ingredient17!))")
        }
        
        if measure18 != nil && ingredient18 != nil {
            result.append("\(String(describing: measure18!)) \(String(describing: ingredient18!))")
        }
        
        if measure19 != nil && ingredient19 != nil {
            result.append("\(String(describing: measure19!)) \(String(describing: ingredient19!))")
        }
        
        if (measure20 != nil && ingredient20 != nil) {
            result.append("\(String(describing: measure20!)) \(String(describing: ingredient20!))")
        }
        
        result.append("\(instructions)")
        
        return result.filter { $0 != "  " && $0 != " "}
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case instructions = "strInstructions"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case measure16 = "strMeasure16"
        case measure17 = "strMeasure17"
        case measure18 = "strMeasure18"
        case measure19 = "strMeasure19"
        case measure20 = "strMeasure20"
    }

}
