//
//  Person.swift
//  NSKeyedArchiver
//
//  Created by Daniyal Yousuf on 3/15/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import Foundation
class Person : NSObject,NSCoding {
    let firstName:String
    let lastName:String
    init(_firstName:String , _lastName:String) {
        firstName = _firstName
        lastName  = _lastName
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(firstName, forKey: "firstname")
        aCoder.encode(lastName, forKey: "lastname")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard
            let firstName = aDecoder.decodeObject(forKey: "firstname") as? String ,
            let lastName  = aDecoder.decodeObject(forKey: "lastname")  as? String
        else { return nil}
        self.init(_firstName: firstName, _lastName: lastName)
    }
    func saveToArchive(){
        let saveData = UUID().uuidString
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths.first
        let fullPath = documentsDirectory?.appendingPathComponent(saveData)
        NSKeyedArchiver.archiveRootObject(Person.init(_firstName: "Apple", _lastName: "Steve"), toFile:"\(String(describing: fullPath))")
    }
    func retreiveObject(){
        let savedData = UUID().uuidString
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths.first
        let fullPath = documentsDirectory?.appendingPathComponent(savedData)
        guard let person = NSKeyedUnarchiver.unarchiveObject(withFile: "\(String(describing: fullPath))") as? Person else {return}
    }
    
}
