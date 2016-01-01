//
//  UserProperties.swift
//  UserProperties
//
//  Created by Ben Bahrenburg on 1/1/16.
//  Copyright © 2016 bencoding.com. All rights reserved.
//

import Foundation

class UserProperties {
    private var defaults : NSUserDefaults
    
    init() {
        defaults = NSUserDefaults.standardUserDefaults()
    }
    
    init(suiteName : String) {
        defaults = NSUserDefaults(suiteName: suiteName)!
    }
    
    func flush() {
        defaults.synchronize()
    }
    
    func hasProperty(key : String) -> Bool {
        defaults.synchronize()
        if let _ = defaults.objectForKey(key){
            return true
        }
        return false
    }
    
    func removeProperty(key : String) {
        defaults.removeObjectForKey(key)
    }
    
    func removeAllProperties() {
        let keys = defaults.dictionaryRepresentation().keys
        for key in keys {
            defaults.removeObjectForKey(key)
        }
    }
    
    func setString(key : String, value : String) {
        defaults.setObject(value, forKey: key)
    }
    
    func setInt(key : String, value : Int) {
        defaults.setInteger(value, forKey: key)
    }
    
    func setBool(key : String, value : Bool) {
        defaults.setBool(value, forKey: key)
    }
    
    func setDouble(key : String, value : Double) {
        defaults.setDouble(value, forKey: key)
    }
    
    func setObject(key : String, value : AnyObject) {
        defaults.setObject(value, forKey: key)
    }
    
    func setDate(key : String, value : NSDate) {
        defaults.setObject(value, forKey: key)
    }
    
    func setURL(key : String, value : NSURL) {
        defaults.setURL(value, forKey: key)
    }
    
    func setData(key : String, value : NSData) {
        defaults.setObject(value, forKey: key)
    }
    
    func getString(key : String) -> String? {
        return defaults.stringForKey(key);
    }
    
    func getString(key : String, defaultValue : String) -> String {
        if let results = getString(key){
            return results
        }
        return defaultValue
    }
    
    func getInt(key : String) -> Int {
        return defaults.integerForKey(key);
    }
    
    func getInt(key : String, defaultValue : Int) -> Int {
        if(hasProperty(key)){
            return defaults.integerForKey(key);
        }
        return defaultValue
    }
    
    func getDouble(key : String) -> Double {
        return defaults.doubleForKey(key);
    }
    
    func getDouble(key : String, defaultValue : Double) -> Double {
        if(hasProperty(key)){
            return getDouble(key);
        }
        return defaultValue
    }
    
    func getObject(key : String) -> AnyObject? {
        return defaults.objectForKey(key)
    }
    
    func getDictionary(key : String, defaultValue : AnyObject) -> AnyObject {
        if(hasProperty(key)){
            if let stored = getObject(key) {
                return stored
            }
        }
        return defaultValue
    }
    
    func getBool(key : String) -> Bool {
        return defaults.boolForKey(key);
    }
    
    func getBool(key : String, defaultValue : Bool) -> Bool {
        if(hasProperty(key)){
            return getBool(key);
        }
        return defaultValue
    }
    
    func getDate(key : String) -> NSDate? {
        if(hasProperty(key)){
            if let stored = getObject(key) {
                return stored as? NSDate
            }
        }
        return nil
    }
    
    func getDate(key : String, defaultValue : NSDate) -> NSDate {
        if(hasProperty(key)){
            if let stored = getObject(key) {
                return stored as! NSDate
            }
        }
        return defaultValue
    }
    
    func getURL(key : String) -> NSURL? {
        return defaults.URLForKey(key)
    }
    
    func getURL(key : String, defaultValue : NSURL) -> NSURL? {
        if let stored = defaults.URLForKey(key) {
            return stored
        }
        return defaultValue
    }
    
    func getData(key : String) -> NSData? {
        return defaults.dataForKey(key)
    }
    
    func getData(key : String, defaultValue : NSData) -> NSData? {
        if let stored = getData(key) {
            return stored
        }
        return defaultValue
    }
    
}