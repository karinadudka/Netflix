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
    
    func getTrendingMovies(complition: @escaping ((Result<[Title], Error>) -> Void)) {
        
        guard let url = URL(string: "\(Constant.baseURL)/3/trending/movie/day?api_key=\(Constant.APIKey)") else { return }
                            
                            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                complition(.success(results.results))
            } catch {
                complition(.failure(APIError.failedToGetData))
            }
        }
                            
        task.resume()
                            
  }
    
    func trendingTvs(complition: @escaping ((Result<[Title], Error>) -> Void)) {
        guard let url = URL(string: "\(Constant.baseURL)/3/trending/tv/day?api_key=\(Constant.APIKey)") else {return}
        let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                complition(.success(results.results))
            } catch {
                complition(.failure(APIError.failedToGetData))
            }

        }
        task.resume()
        
    }
    
    func getUpcomingMovies(complition: @escaping ((Result<[Title], Error>) -> Void)){
        guard let url = URL(string: "\(Constant.baseURL)/3/movie/upcoming?api_key=\(Constant.APIKey)&language=en-US&page=1") else {return}
        let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                complition(.success(results.results))
            } catch {
                complition(.failure(APIError.failedToGetData))
            }
    }
        task.resume()
}

    func getPopularMovies(complition: @escaping ((Result<[Title], Error>) -> Void)){
        guard let url = URL(string: "\(Constant.baseURL)/3/movie/popular?api_key=\(Constant.APIKey)&language=en-US&page=1") else {return}
        let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                complition(.success(results.results))
            } catch {
                complition(.failure(APIError.failedToGetData))
            }
    }
        task.resume()
   }
    
    func getTopRatedMovies(complition: @escaping ((Result<[Title], Error>) -> Void)){
        guard let url = URL(string: "\(Constant.baseURL)/3/movie/top_rated?api_key=\(Constant.APIKey)&language=en-US&page=1") else {return}
        let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                complition(.success(results.results))
            } catch {
                complition(.failure(APIError.failedToGetData))
            }
    }
        task.resume()
   }
}
