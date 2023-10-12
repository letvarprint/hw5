//
//  File.swift
//  hw5
//
//  Created by Alexandru Brixencov on 11.10.2023.
//

import Foundation

struct User {
    let userName: String
    let password: String
    let userInfo: UserInformation
    
    static func getUser() -> User {
        User(
            userName: "user",
            password: "password",
            userInfo: UserInformation(
                name: "Tim",
                surname: "Cook",
                company: "Apple",
                department: "Managment",
                possition: "CEO",
                story: "Американский управленец, менеджер, занимавший в разное время высокие посты в нескольких крупных компаниях. Являлся другом и помощником Стива Джобса. После ухода основателя Apple стал генеральным директором компании.",
                image: "Tim-Cook-Circle"
            )
        )
    }
}

struct UserInformation {
    let name: String
    let surname: String
    let company: String
    let department: String
    let possition: String
    let story: String
    let image: String
    
    var bioTitle: String {
        "\(name) \(surname) Bio"
    }
}
                  
