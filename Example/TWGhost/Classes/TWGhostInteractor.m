//
//  TWGhostInteractor.m
//  TWGhost_Example
//
//  Created by TW on 2021/3/17.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "TWGhostInteractor.h"
#import <YYCache/YYCache.h>
#import <TWFoundation/NSDate+twTool.h>


@interface TWGhostInteractor ()

@property (nonatomic, strong) YYDiskCache *yyDiskCache;

@end


@implementation TWGhostInteractor


- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark - VCDataSource

- (void)fetchArray:(NSString *)className {
    if (!className) {
        return;
    }
    //    作者：萧溪
    //    链接：https://www.jianshu.com/p/0cca57525f29
    //    来源：简书
    //    简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。

    NSString *basePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) firstObject];
    basePath = [basePath stringByAppendingPathComponent:@"YYCache_TWGhost"];
    
    self.yyDiskCache   = [[YYDiskCache alloc] initWithPath:[basePath stringByAppendingPathComponent:className]];
    
    self.yyDiskCache.customArchiveBlock = ^NSData * _Nonnull(id  _Nonnull object) {
        NSArray * array = (NSArray *)object;
        return [array yy_modelToJSONData];
    };
    self.yyDiskCache.customUnarchiveBlock = ^id _Nonnull(NSData * _Nonnull data) {
        // https://blog.csdn.net/qw656567/article/details/52367618
        
        id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSMutableArray * mArray = [NSMutableArray new];
        NSArray *array = (NSArray *)jsonObject;
        for (id oneID in array) {
            [mArray addObject:[TWGhostListEntity yy_modelWithDictionary:oneID]];
        }
        return mArray;
    };
    
    //BOOL isContain = [self.yyDiskCache containsObjectForKey:@"wkq"];
    self.infoArray = (NSMutableArray *)[self.yyDiskCache objectForKey:@"wkq"];
    if (!self.infoArray) {
        self.infoArray = [NSMutableArray new];
    }
}

- (void)addDic:(NSDictionary *)dic des:(NSString *)description {
    if (!self.yyDiskCache) {
        return;
    }
    {
        TWGhostListEntity * entity = [TWGhostListEntity new];
        entity.des  = description;
        entity.dic  = dic;
        entity.time = [NSDate stringFromNow:nil];
        entity.version = [NSString stringWithFormat:@"%@_%@", [self getAppVersion_short], [self getAppVersion_build]];
        
        [self.infoArray addObject:entity];
    }
    
    [self.yyDiskCache setObject:self.infoArray forKey:@"wkq"];
    
    //    BOOL isContain = [self.yyDiskCache containsObjectForKey:@"wkq"];
    //    NSLog(@"isContain :%i", isContain);
    //    id value = [self.yyDiskCache objectForKey:@"wkq"];
    //    NSLog(@"value = %@", value);
}

- (void)updateDic {
    [self.yyDiskCache setObject:self.infoArray forKey:@"wkq"];
}

/**
 *  对外版本号
 */
- (NSString *)getAppVersion_short {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

/**
 *  对内build号
 */
- (NSString *)getAppVersion_build {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
}


@end
