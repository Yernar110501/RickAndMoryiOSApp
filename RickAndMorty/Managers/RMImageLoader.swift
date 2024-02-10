//
//  ImageLoader.swift
//  RickAndMorty
//
//  Created by Yernar Baiginzheyev on 10.02.2024.
//

import Foundation

final class RMImageLoader {
    //MARK: - Properties
    static let shared = RMImageLoader()
    
    private var imageDataCache = NSCache<NSString, NSData>()
    
    //MARK: - Initializers
    private init(){}
    
    //MARK: - Helpers
    
    /// Get image content with url
    /// - Parameters:
    ///   - url: url adress of image
    ///   - completion: callback
    public func downloadImage(_ url: URL, completion:  @escaping (Result<Data, Error>) -> () ) {
        let key = url.absoluteString as NSString

        if let data = imageDataCache.object(forKey: key) {
            completion(.success(data as Data))
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            
            let value = data as NSData
            self?.imageDataCache.setObject(value, forKey: key)
            
            completion(.success(data))
        }
        task.resume()
    }
}
