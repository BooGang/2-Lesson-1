//
//  Session.swift
//  2 Lesson 1
//
//  Created by Богдан Олещенко on 31.10.2021.
//

import Foundation
final class Session {
    
private init(){}
    
  static let shared = Session()
    
  var token: String = ""
  var userId = ""
}
