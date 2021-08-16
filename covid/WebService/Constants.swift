//
//  Constants.swift
//  covid
//
//  Created by Eslam Wael on 8/13/21.
//  Copyright © 2021 Eslam Wael. All rights reserved.
//

import Foundation

public struct Constants {
    
    /// The API's base URL to get countries
    public static let countryBaseUrl = "https://restcountries.eu/rest/v2"
    
    /// The API's base URL to get countries
    public static let covidBaseUrl = "https://covid-19-data.p.rapidapi.com/"
    
    ///API Key
    public static let covidApiKey = "c5e241681c87e0206115395de7435e28"
    
    /// The parameters (Queries) that we're gonna use
    public struct Parameters {
        public static let api_key = "api_key"
    }
    
    /// The header fields
    public enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    /// The header fields
    public enum CovidKeysHeaderField: String {
        case rapidApiKey = "8df752592amsh7aa65f8392d7b61p10d771jsn6e5235474204"
        case rapidApiHost = "covid-19-data.p.rapidapi.com"
   }
    
     /// The header fields
     public enum CovidKeysHeader: String {
         case rapidApiKey = "x-rapidapi-key"
         case rapidApiHost = "x-rapidapi-host"
    }
    
    /// The content type (JSON)
    public enum ContentType: String {
        case json = "application/json"
    }
    
    static let countriesEndpoint = { (countryName: String) -> String in
        return "name/\(countryName)"
    }
    
    static let covidEndpoint = "country"
    
}
