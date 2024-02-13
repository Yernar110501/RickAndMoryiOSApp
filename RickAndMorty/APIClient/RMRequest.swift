//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Yernar Baiginzheyev on 22.01.2024.
//

import Foundation

/// Object that represents single API call
final class RMRequest {
    
    //MARK: - Properties
    //Base url
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    //Endpoint
    private let rmEndpoint: RMEndpoint
    
    //Path components
    private let pathComponents: [String]
    
    //Query parameter
    private let queryParameters: [URLQueryItem]
    
    
    /// Constructed urlString for API call
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += rmEndpoint.rawValue
        
        if !pathComponents.isEmpty {
            string += "/"
            pathComponents.forEach({ string += "\($0)," })
            string.removeLast()
            
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
        }
        
        return string
    }
    ///Desired API method
    public let httpMethod = "GET"
    
    public var url: URL? { URL(string: urlString) }
    
    //MARK: - Initilizers
    
    /// Construct request
    /// - Parameters:
    ///   - rmEndpoint: Target endpoint location, character or episode
    ///   - pathComponents: Collection of path components
    ///   - queryParameters: Collection of query parameters
    public init(rmEndpoint: RMEndpoint,
                pathComponents: [String] = [],
                queryParameters: [URLQueryItem] = [] ) {
        self.rmEndpoint = rmEndpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    //https://rickandmortyapi.com/api/character/2

    convenience init?(url: URL) {
        let string = url.absoluteString
        if !string.contains(Constants.baseUrl) {
            return nil
        }
        let trimmed = string.replacingOccurrences(of: Constants.baseUrl+"/", with: "")
        if trimmed.contains("/") {
            let components = trimmed.components(separatedBy: "/")
            if !components.isEmpty {
                let endpointString = components[0]
                var pathComponents: [String] = []
                if components.count > 1 {
                    pathComponents = components
                    pathComponents.removeFirst()
                }
                if let rmEndpoint = RMEndpoint(rawValue: endpointString) {
                    self.init(rmEndpoint: rmEndpoint, pathComponents: pathComponents)
                    return
                }
            }
            
        } else if trimmed.contains("?"){
            let components = trimmed.components(separatedBy: "?")
            if !components.isEmpty, components.count >= 2 {
                let endpointString = components[0]
                let queryItemsString = components[1]
                let queryItem:[URLQueryItem] = queryItemsString.components(separatedBy: "&").compactMap {
                    guard $0.contains("=") else {
                        return nil
                    }
                    let parts = $0.components(separatedBy: "=")
                    return URLQueryItem(name: parts[0], value: parts[1])
                }
                if let rmEndpoint = RMEndpoint(rawValue: endpointString) {
                    self.init(rmEndpoint: rmEndpoint, queryParameters: queryItem )
                    return
                }
            }
        }
        return nil
    }
}

extension RMRequest {
    static let listCharactersRequests = RMRequest(rmEndpoint: .character)
}
