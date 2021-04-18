//
//  ViewController.m
//  IniParserDemo
//
//  Created by Eric on 4/17/21.
//

#import "ViewController.h"

#import "DJIniParser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *filePath = [NSBundle.mainBundle pathForResource:@"config" ofType:@"ini"];
    
    NSDictionary<NSString *, NSDictionary<NSString *, NSString *> *> *dict = nil;
    
    @try {
        dict = [DJIniParser parseWithFilePath:filePath];
    } @catch (NSException *exception) {
        NSLog(@"解析失败");
    } @finally {
    }
    
    NSLog(@"dict:%@", dict);
}

@end
