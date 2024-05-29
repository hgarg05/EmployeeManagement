//
//  LoginViewModel.swift
//  EmployeeManagement
//
//  Created by SpringCT on 29/05/24.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {

    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isLoginSuccess: Bool = false;

    func login() {
        LoginAction(
            parameters: LoginRequest(
                email: username,
                password: password
            )
        ).call { _ in
            // Login successful, navigate to the Home screen
            UserDefaults.standard.set(self.username,forKey: "username")
            UserDefaults.standard.set(self.password,forKey: "password")
            self.isLoginSuccess = true
        }
    }
}

struct LoginRequest: Encodable {
    let email: String
    let password: String
}

struct LoginResponse: Decodable {
    //let data: LoginResponseData
    let status: String
}

struct LoginResponseData: Decodable {
    let status: String
}

struct LoginAction {
    
    var parameters: LoginRequest
    
    func call(completion: @escaping (LoginResponse) -> Void) {
        
        let scheme: String = "https"
      //  let host: String = "reqres.in/api"
        let path = "/reqres.in/api/login"
        
        var components = URLComponents()
        components.scheme = scheme
        components.path = path
        
        
        guard let url = components.url else {
            print("Incorrect url")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "post"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            request.httpBody = try JSONEncoder().encode(parameters)
        } catch {
            // Error: Unable to encode request parameters
            print("Unable to encode request parameters")
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
                if let data = data {
                //***Some issue with the URL -> Does not looks like Login URL, hence, mocked the response***
               // let response = try? JSONDecoder().decode(LoginResponse.self, from: data)
                let response : LoginResponse? = LoginResponse(status: "Success")
                if let response = response {
                    print("Sucess")
                    completion(response)
                } else {
                    // Error: Unable to decode response JSON
                    print("Unable to decode response JSON")
                }
            } else {
                // Error: API request failed
                print("API request failed")
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}
