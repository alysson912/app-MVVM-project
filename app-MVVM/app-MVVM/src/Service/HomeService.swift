//
//  HomeService.swift
//  app-MVVM
//
//  Created by ALYSSON DODO on 06/04/23.
//

import UIKit
import Alamofire

class HomeService {
    
    func getHomeDataAlamofire(completion: @escaping (HomeData?, Error?) -> Void){
        let url: String = "https://run.mocky.io/v3/6749b118-ae2e-47b7-99bf-41b3785e58bc"
        AF.request(url, method: .get).validate().responseDecodable(of: HomeData.self){ response in
            
            debugPrint(response)
            switch response.result{
                
            case .success(let success):
                print("succes -> \(#function)")
                completion(success, nil)
            case .failure(let error):
                print("error -> \(#function)")
                completion(nil, error)
            }
        }
    }
    
    
    // dados mockados
    func getHomeDataJson(completion: @escaping (HomeData?, Error?) -> Void){
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json"){ // buscando o local do data
            
            do {
                 let data = try Data(contentsOf: url) // passando a rota do json, transforma o json em binario para depois trasformar em um objeto
                let homeData: HomeData = try JSONDecoder().decode(HomeData.self, from: data)
                completion(homeData, nil)
            } catch  {
                completion(nil, error)
            }
        }
    }

}
