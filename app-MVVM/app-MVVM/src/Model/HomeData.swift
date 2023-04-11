//
//  HomeData.swift
//  app-MVVM
//
//  Created by ALYSSON DODO on 11/04/23.
//

import UIKit
//Decodable -> transformar o json em um Objeto
//Encodable  -> torna um tipo de dado em swift para json (operação iversa)
//Codable -> faz os dois anteriores

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct HomeData: Codable {
    var stories: [Stories]?
    var posts: [Posts]?
}



