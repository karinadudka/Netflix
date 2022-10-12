//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Карина Дудка on 10.10.2022.
//

import Foundation

struct Constant {
    static let APIKey = "1619146867e10a00ddbc9984370b883f"
    static let baseURL = "https://api.themoviedb.org"
    
    enum CodingKeys: String, CodingKey {
        case APIKey = "API_KEY"
        case baseURL
    }
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(complition: @escaping ((Result<[Movie], Error>) -> Void)) {
        
        guard let url = URL(string: "\(Constant.baseURL)/3/trending/movie/day?api_key=\(Constant.APIKey)") else { return }
                            
                            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                complition(.success(results.results))
            } catch {
                complition(.failure(error))
            }
        }
                            
        task.resume()
                            
  }
    
    func trendingTvs(complition: @escaping ((Result<[Tv], Error>) -> Void)) {
        guard let url = URL(string: "\(Constant.baseURL)/3/trending/movie/day?api_key=\(Constant.APIKey)") else {return}
        let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTvsResponse.self, from: data )
                print(results)
            } catch {
                print(error)
            }

        }
        task.resume()
        
    }
}
