//
//  AppErrors.swift
//  RecipeApp
//
//  Created by Kary Martinez on 11/5/21.
//

import Foundation

enum AppErrors: Error {
    case unauthenticated
    case invalidJSONResponse
    case couldNotParseJSON(rawError: Error)
    case noInternetConnection
    case badURL
    case badstatusCode
    case noDataReceived
    case notAnImage
    case other(rawError: Error)
}
