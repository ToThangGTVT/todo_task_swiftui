//
//  NetworkManager.swift
//  task
//
//  Created by ToThang on 10/19/22.
//

import Foundation

class NetworkManager: ObservableObject {
    
    func post(url: String, body: AnyObject, completionHandle: @escaping (Data) -> Void) {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
                guard let data = data else { return  }
                completionHandle(data)
            } catch {
                print("error")
            }
        })

        task.resume()
    }
    
    func callApiGet<T: Decodable>(url: String, type: T.Type, completionHandle: @escaping (T) -> Void) {
        let decoder = JSONDecoder()
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! NSDictionary
                guard let response = response else { return  }
                guard let httpResponse = response as? HTTPURLResponse else { return  }
                guard let data = data else { return  }
                let people = try decoder.decode(type.self, from: data)
                if (200...299).contains(httpResponse.statusCode) {
                    completionHandle(people)
                }
            } catch {
                print("error")
            }
        })

        task.resume()
    }
    
}