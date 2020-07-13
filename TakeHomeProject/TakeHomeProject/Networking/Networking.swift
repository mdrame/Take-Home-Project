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
    
    func fetchData(search title: String, completion: @escaping ([News])->Void) {
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
            
            let presentableData =  self.jsonData(data: data)
            guard let data = presentableData else { return }
            completion(data)
        }
        taskGiven.resume()
        
        
    }
    
    
    func jsonData(data: Data?)->[News]? {
        let jsonDecoder = JSONDecoder()
        do {
            let encodedData = try? jsonDecoder.decode(News.self, from: data!)
            let news = News(status: encodedData?.status ?? "Nil", articles: [NewsBody(title: encodedData?.articles?[0].title ?? "No Title", url: encodedData?.articles?[0].url ?? "No URL", urlToImage: encodedData?.articles?[0].urlToImage ?? "No URL Image")] ?? nil)
//            print(news)
            return [news]
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    
    
}
