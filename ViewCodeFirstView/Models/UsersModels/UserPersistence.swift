//
//  Persistence.swift
//  ViewCodeFirstView.
//
//  Created by Gustavo Ferreira bassani on 01/05/25.
//

import Foundation

let key: String = "users"
let keyUserLogged: String = "userLogged"

struct Persistence {
    
    static func getUsers() -> Users? {
        
        if let users = UserDefaults.standard.value(forKey: key) as? Data{
            
            let decoder = JSONDecoder()
            
            do {
                
                let usersDecoded = try decoder.decode(Users.self, from: users )
                
                return usersDecoded
                
            } catch {
                
                print(error.localizedDescription)
                
            }
        }
        return nil
    }
    
    
    static func saveUser(newUser: User) {
        
        var users = getUsers() ?? Users(usersList: [])
        users.usersList.append(newUser)
        
        do {
            
            let encoder = JSONEncoder()
            let encodedUsers = try encoder.encode(users)
            UserDefaults.standard.set(encodedUsers, forKey: key)
            
        } catch {
            
            print(error.localizedDescription)
            
        }
    }
    
    static func removeUserAndSaveList(userToRemove: User) {
        
        var users = getUsers() ?? Users(usersList: [])
        
        users.usersList.removeAll { user in
            
            user == userToRemove
            
        }
        
        do {
            
            let encoder = JSONEncoder()
            let encodedUsers = try encoder.encode(users)
            UserDefaults.standard.set(encodedUsers, forKey: key)
            
        } catch {
            
            print(error.localizedDescription)
            
        }
    }
}
