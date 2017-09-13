//
//  CTCollectionViewSection.h
//  CTCollectionViewDelegateDemo
//
//  Created by wenjie on 2017/9/12.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CTCollectionViewItem;

@interface CTCollectionViewSection : NSObject

@property (nonatomic, strong) CTCollectionViewItem *header;

@property (nonatomic, strong) NSMutableArray <CTCollectionViewItem *>*items;

@property (nonatomic, strong) CTCollectionViewItem *footer;

@property (nonatomic, assign) CGFloat minimumLineSpacing;

@property (nonatomic, assign) CGFloat minimumInteritemSpacing;

@property (nonatomic, assign) UIEdgeInsets insets;

@end
