//
//  GZHProjectUITests.m
//  GZHProjectUITests
//
//  Created by gzh on 17/3/3.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GZHProjectUITests : XCTestCase

@end

@implementation GZHProjectUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

-(void)textLogin{
    //XCUIApplication 这是应用的代理，他能够把你的应用启动起来，并且每次都在一个新进程中。
    XCUIApplication *app = [[XCUIApplication alloc] init];
    //XCUIElement 这是 UI 元素的代理。元素都有类型和唯一标识。可以结合使用来找到元素在哪里，如当前界面上的一个输入框
    XCUIElement *usernameTextField = app.textFields[@"username:"];
    [usernameTextField tap];
    [usernameTextField typeText:@"xiaofei"];
    
    XCUIElement *passwordTextField = app.textFields[@"password:"];
    [passwordTextField tap];
    [passwordTextField tap];
    [passwordTextField typeText:@"12345"];
    [[[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element tap];
    [app.buttons[@"login"] tap];
}

@end
