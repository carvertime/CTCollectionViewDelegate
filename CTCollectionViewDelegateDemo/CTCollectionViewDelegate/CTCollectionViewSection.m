//
//  CTCollectionViewSection.m
//  CTCollectionViewDelegateDemo
//
//  Created by wenjie on 2017/9/12.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "CTCollectionViewSection.h"

@implementation CTCollectionViewSection

- (NSMutableArray<CTCollectionViewItem *> *)items{
    if (_items == nil) {
        _items = @[].mutableCopy;
    }
    return _items;
}


@end
