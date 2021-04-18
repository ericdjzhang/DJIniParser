//
//  DJIniParser.m
//  IniParserDemo
//
//  Created by Eric on 4/17/21.
//

#import "DJIniParser.h"

typedef NSMutableDictionary<NSString *, NSString *> DJIniSectionMap;
typedef NSMutableDictionary<NSString *, DJIniSectionMap *> DJIniSectionsMap;

@implementation DJIniParser

+ (NSDictionary<NSString *, NSDictionary<NSString *, NSString *> *> *)parseWithFilePath:(NSString *)filePath {
    NSAssert(filePath.length, @"path invaild.path:%@", filePath);

    NSString *fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    NSArray<NSString *> *linesArray = [fileContent componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    DJIniSectionsMap *sectionsMap = [DJIniSectionsMap dictionary];
    DJIniSectionMap *sectionMap = nil;
    NSCharacterSet *whitespaceCharacterSet = [NSCharacterSet whitespaceCharacterSet];
    
    for (NSString *line in linesArray) {
        if (line.length == 0) {
            continue;
        }
        
        NSString *optimizeLine = line;
        if ([optimizeLine containsString:@";"]) {
            NSRange commentDividerRange = [line rangeOfString:@";"];
            // 去掉注释
            optimizeLine = [optimizeLine substringToIndex:commentDividerRange.location];
        }
        
        // 去掉头尾的空格
        optimizeLine = [optimizeLine stringByTrimmingCharactersInSet:whitespaceCharacterSet];
        
        if ([optimizeLine hasPrefix:@"["]) {
            NSAssert([optimizeLine hasSuffix:@"]"], @"it doesnot match `[]`, line:%@", optimizeLine);
            
            NSString *sectionKey = [optimizeLine substringWithRange:NSMakeRange(1, optimizeLine.length - 2)];
            sectionKey = [sectionKey stringByTrimmingCharactersInSet:whitespaceCharacterSet];
            sectionMap = [DJIniSectionMap dictionary];
            sectionsMap[sectionKey.lowercaseString] = sectionMap;
        }
            
        if ([optimizeLine containsString:@"="]) {
            NSAssert(sectionMap, @"section is not exist, line:%@", optimizeLine);
            
            NSRange range = [optimizeLine rangeOfString:@"="];
            
            NSString *key = [optimizeLine substringToIndex:range.location];
            key = [key stringByTrimmingCharactersInSet:whitespaceCharacterSet];
            
            NSString *value = [optimizeLine substringFromIndex:range.location + 1];
            value = [value stringByTrimmingCharactersInSet:whitespaceCharacterSet];
            
            sectionMap[key.lowercaseString] = value;
        }
    }
    
    return sectionsMap;
}

@end
