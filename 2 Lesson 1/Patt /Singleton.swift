//
//  File.swift
//  2 Lesson 1
//
//  Created by Богдан Олещенко on 24.10.2021.
//

import Foundation
final class Session {
    
private init(){}
    
  static let shared = Session()
    
  var token: String = ""
  var userId: Int = 0
}

