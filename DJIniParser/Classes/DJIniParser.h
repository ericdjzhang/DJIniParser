//
//  DJIniParser.h
//  IniParserDemo
//
//  Created by Eric on 4/17/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DJIniParser : NSObject

+ (NSDictionary<NSString *, NSDictionary<NSString *, NSString *> *> *)parseWithFilePath:(NSString *)filePath;

@end

NS_ASSUME_NONNULL_END
