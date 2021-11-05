//
//  APIClientFile.swift
//  RecipeApp
//
//  Created by Kary Martinez on 11/5/21.
//

import Foundation

struct APIClient {
    func fetchData(completion: @escaping (Result<[Category], Error>) -> ()) {
        
        let endpointURLString = "https://www.themealdb.com/api/json/v1/1/categories.php"
        
        guard let url = URL(string: endpointURLString) else {
            print("bad url")
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let error = error {
                return completion(.failure(error))
            }
            guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode) else {
                print("bad status code")
                return
            }
            if let jsonData = data {
                do {
                    let categories = try
                        JSONDecoder().decode(CategoryList.self, from: jsonData).categories
                    completion(.success(categories))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
    }
}
