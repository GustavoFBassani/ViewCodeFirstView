//
//  Persistence.swift
//  ViewCodeFirstView.
//
//  Created by Gustavo Ferreira bassani on 01/05/25.
//

import Foundation

let key: String = "users"

struct User: Codable {
    
    var name: String
    var date: Date
    var email: String
    var password: String
    
}

struct Users: Codable {
    var users: [User]
}

struct Persistence {
    
    static func getUser() -> Users? {
        
        if let users = UserDefaults.standard.value(forKey: key) as? Data{
            
            let decoder = JSONDecoder()
            
            do {
                
                let userDecoded = try decoder.decode(Users.self, from: users )
                return userDecoded
                
            } catch {
                
                print(error.localizedDescription)
                
            }
        }
        return nil
    }
    
    
    static func saveUser(newUser: User) {

        var users = getUser() ?? Users(users: [])
        users.users.append(newUser)
        
        do {
            
            let encoder = JSONEncoder()
            let encodedUsers = try encoder.encode(users)
            UserDefaults.standard.set(encodedUsers, forKey: key)
            
        } catch {
            
            print(error.localizedDescription)
            
        }
    }
}
