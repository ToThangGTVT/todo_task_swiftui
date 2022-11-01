//
//  NetworkManager.swift
//  task
//
//  Created by ToThang on 10/19/22.
//

import Foundation

class NetworkManager: ObservableObject {
    
    func post<T: Decodable>(url: String, body: Codable, typeResponse: T.Type, completionHandle: @escaping (T) -> Void) {
        
        print("url:::\(url)")
        
        let decoder = JSONDecoder()
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(body)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if let token = UserDefaultManager.shared.getToken() {
            request.addValue(token, forHTTPHeaderField: "cookie")
        }

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let response = response else { return  }
                guard let httpResponse = response as? HTTPURLResponse else { return  }
                guard let data = data else { return  }
                print(response)
                let result = try decoder.decode(typeResponse.self, from: data)
                if (200...299).contains(httpResponse.statusCode) {
                    completionHandle(result)
                }
            } catch {
                print("::::::ERROR CALL API::::::")
            }
        })

        task.resume()
    }
    
    func put<T: Decodable>(url: String, body: Codable, typeResponse: T.Type, completionHandle: @escaping (T) -> Void) {
        
        print("url:::\(url)")
        
        let decoder = JSONDecoder()
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "PUT"
        request.httpBody = try? JSONEncoder().encode(body)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if let token = UserDefaultManager.shared.getToken() {
            request.addValue(token, forHTTPHeaderField: "cookie")
        }

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let response = response else { return  }
                guard let httpResponse = response as? HTTPURLResponse else { return  }
                guard let data = data else { return  }
                print(response)
                let result = try decoder.decode(typeResponse.self, from: data)
                if (200...299).contains(httpResponse.statusCode) {
                    completionHandle(result)
                }
            } catch {
                print("::::::ERROR CALL API::::::")
            }
        })

        task.resume()
    }
    
    func callApiGet<T: Decodable>(url: String, returnType: T.Type, completionHandle: @escaping (T) -> Void) {
        
        print("url:::\(url)")

        let decoder = JSONDecoder()
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if let token = UserDefaultManager.shared.getToken() {
            request.addValue(token, forHTTPHeaderField: "cookie")
        }
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                guard let response = response else { return  }
                guard let httpResponse = response as? HTTPURLResponse else { return  }
                guard let data = data else { return  }
                let people = try decoder.decode(returnType.self, from: data)
                if (200...299).contains(httpResponse.statusCode) {
                    completionHandle(people)
                }
            } catch {
                print("::::::ERROR CALL API::::::")
            }
        })

        task.resume()
    }
    
}
