//
//  APIClientFile.swift
//  RecipeApp
//
//  Created by Kary Martinez on 11/5/21.
//

import Foundation

struct APIClient<T: Decodable> {
    
    private let urlSession = URLSession(configuration: URLSessionConfiguration.default)

    
    func fetchData(url: String, completion: @escaping (Result<T, Error>) -> ()) {
        
        guard let urlEndpoint = URL(string: url) else {
            print("bad url")
            return
        }
        urlSession.dataTask(with: urlEndpoint) {
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
                    let outcome = try
                        JSONDecoder().decode(T.self, from: jsonData)
                    completion(.success(outcome))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        .resume()
    }
}
