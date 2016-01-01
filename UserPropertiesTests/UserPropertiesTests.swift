//
//  UserPropertiesTests.swift
//  UserPropertiesTests
//
//  Created by Ben Bahrenburg on 1/1/16.
//  Copyright © 2016 bencoding.com. All rights reserved.
//

import XCTest
@testable import UserProperties

class UserPropertiesTests: XCTestCase {
    
    let properties = UserProperties()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        properties.removeAllProperties()
        super.tearDown()
    }
    
    func testHasField() {
        let testValue = true
        let testField = "foo_bool_has_field"
        
        properties.setBool(testField,value: testValue)
        
        let exists = properties.hasProperty(testField)
        
        XCTAssert((exists == true), "Field Exists")
        
    }
    
    func testRemoveField() {
        let testValue = true
        let testField = "foo_bool_to_remove"
        
        properties.setBool(testField,value: testValue)
        
        var exists = properties.hasProperty(testField)
        
        XCTAssert((exists == true), "Value written")
        properties.removeProperty(testField)
        
        exists = properties.hasProperty(testField)
        
        XCTAssert((exists == false), "Value removed")
        
    }
    
    func testSaveBool() {
        let testValue = true
        let testField = "foo_bool"
        
        properties.setBool(testField,value: testValue)
        
        let stored = properties.getBool(testField)
        
        XCTAssert((testValue == stored), "Written and stored values are equal")
    }
    
    func testSaveString() {
        let testValue = "bar"
        let testField = "foo_string"
        
        properties.setString(testField,value: testValue)
        
        let stored = properties.getString(testField)
        
        XCTAssert((testValue == stored), "Written and stored values are equal")
    }
    
}
