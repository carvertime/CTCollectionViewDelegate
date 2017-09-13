//
//  CTCollectionViewDelegate.h
//  CTCollectionViewDelegateDemo
//
//  Created by wenjie on 2017/9/12.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CTCollectionViewItem;
@class CTCollectionViewSection;

@interface CTCollectionViewDelegate : NSObject

@property (nonatomic, strong) NSMutableArray <CTCollectionViewSection *>*sections;

@property (nonatomic, weak) id owner;

- (CTCollectionViewItem *)getHeaderAtIndex:(NSInteger)index;
- (CTCollectionViewItem *)getItemAtIndexPath:(NSIndexPath *)indexPath;
- (CTCollectionViewItem *)getFooterAtIndex:(NSInteger)index;
- (CTCollectionViewSection *)getSectionAtIndex:(NSInteger)index;

@end
