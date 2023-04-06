//
//  HomeService.swift
//  app-MVVM
//
//  Created by ALYSSON DODO on 06/04/23.
//

import UIKit

class HomeService {
    
    func getHomeDataJson(completion: @escaping (Posts?, Error?) -> Void){
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json"){ // buscando o local do data
            
            do {
                 let data = try Data(contentsOf: url)
                
            } catch  {
                <#statements#>
            }
        }
    }

}
