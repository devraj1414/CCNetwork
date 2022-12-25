//
//  File.swift
//  
//
//  Created by Suruchi Kumari on 12/25/22.
//

import Foundation
public struct EmployeeResult : Codable{
    let status : String
    let data : [EmployeeData]
}
public struct EmployeeData : Codable{
    let employee_name : String
}

public class EmployeeViewModel{
    
    public init() {
        
    }
    
    public let webServcie = WebService()
    public func fetchEmployeeData(){
        let url  = "https://dummy.restapiexample.com/api/v1/employees"
        webServcie.fetchData(url: URL(string: url)!) { data in
            return try! JSONDecoder().decode([Employee].self, from: data)
        } completion: { result in
            switch result{
            case .success(let employee):
                print(employee)
            case .failure(let error):
                print(error)
            }
        }

    }
}
