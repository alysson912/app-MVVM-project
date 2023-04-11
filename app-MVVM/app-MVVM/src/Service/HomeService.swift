//
//  HomeService.swift
//  app-MVVM
//
//  Created by ALYSSON DODO on 06/04/23.
//

import UIKit

class HomeService {
    
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
