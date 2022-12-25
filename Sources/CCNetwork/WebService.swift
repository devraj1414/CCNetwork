//
//  WebService.swift
//  SampleProject
//
//  Created by Suruchi Kumari on 12/22/22.
//

import Foundation

enum NetworkError : Error{
    case badRequest
    case decodingError
}
public struct Employee: Codable{
   public let name : String
   public let address : String
   public let age : Int
}

public class WebService{
    public init() {}
    public func getEmployees()->[Employee]{
        return ([Employee(name: "Apple", address: "India Inc Ltd", age: 32),
        Employee(name: "Samsung", address: "San Fransisco, SFO, California", age: 44),
        Employee(name: "Googe", address: "District of Colombia, WTC", age: 22)])
    }
    
    func fetchData<T:Codable>(url : URL, parse : @escaping(Data) ->T, completion : @escaping(Result<T?, NetworkError>)->()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, (response as? HTTPURLResponse)?.statusCode == 200 else{
                completion(.failure(.badRequest))
                return
            }
            let result = parse(data)
            completion(.success(result))
        }.resume()
    }
    
//    func fetchClientData(url : URL, parse: @escaping (Data) -> T?, completion : @escaping (Result<T?, NetworkError>)){
//        
//
//        URLSession.shared.dataTask(with: url) { d, r, e in
//
//        }.resume()
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil, (response as? HTTPURLResponse)?.statusCode == 200 else {
//                completion(.failure(.decodingError))
//                return
//            }
//            let result = parse(data)
//            completion(.success(result))
//        }.resume()
//    }
}
