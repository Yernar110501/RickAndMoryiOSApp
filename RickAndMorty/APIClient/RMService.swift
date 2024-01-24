//
//  RMService.swift
//  RickAndMorty
//
//  Created by Yernar Baiginzheyev on 22.01.2024.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMService {
    //MARK: - Properties
    /// Shared singleton instance
    static let shared = RMService()
    
    enum RMServieError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    //MARK: - Initializer
    /// Privitized constructor
    private init() { }
    
    //MARK: - Public Methods
    /// Send RIck and Morty API call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> ()
    ) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServieError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data, error == nil else {
                completion(.failure(error ?? RMServieError.failedToGetData))
                return
            }
            
            //Decode responce
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    //MARK: - Private Methods
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil}
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        //request.addValue("Content-Type", forHTTPHeaderField: "application/json")
        return request
    }
    
}
