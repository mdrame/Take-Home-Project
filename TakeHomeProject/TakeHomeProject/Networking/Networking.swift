//
//  Networking.swift
//  TakeHomeProject
//
//  Created by Mohammed Drame on 7/10/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import Foundation


class Networking {
    
    let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=56432932cc67427e85d11ce25dda79cb"
    
    func fetchData() {
        let mainURL = URL(string: url)
        let session = URLSession(configuration: .default)
        let taskGiven = session.dataTask(with: mainURL!) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    return
            }
            
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            
            self.jsonData(data: data)
        }
        taskGiven.resume()
        
        
    }
    
    
    func jsonData(data: Data?) {
        let jsonDecoder = JSONDecoder()
        do {
            let encodedData = try? jsonDecoder.decode(News.self, from: data!)
            let news = News(status: encodedData?.status ?? "Not ok")
            print(news.status)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    
}
