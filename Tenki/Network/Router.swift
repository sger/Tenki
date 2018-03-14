//
//  Router.swift
//  Tenki
//
//  Created by Spiros Gerokostas on 13/03/2018.
//  Copyright © 2018 Spiros Gerokostas. All rights reserved.
//

import Alamofire

public typealias ParametersList = [String: String]

public enum Router: URLRequestConvertible {
    static let BaseURL: URL = URL(string: "https://api.darksky.net")!

    case forecast(lat: Double, lon: Double)

    var path: String {
        switch self {
        case .forecast(let lat, let lon): return "/forecast/\(Secrets.darkSkyAPIKey)/\(lat),\(lon)"
        }
    }

    var httpMethod: Alamofire.HTTPMethod {
        switch self {
        case .forecast(_, _): return .get
        }
    }

    public func asURLRequest() throws -> URLRequest {
        let url: URL = Router.BaseURL.appendingPathComponent(self.path)
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = self.httpMethod.rawValue

        let tmpRequest: URLRequest = try {
            switch self {
            case .forecast(_, _):
                return try URLEncoding.queryString.encode(request, with: nil)
            }
        }()
        print("tmpRequest \(tmpRequest.url?.absoluteString ?? " - ")")
        return tmpRequest
    }
}
