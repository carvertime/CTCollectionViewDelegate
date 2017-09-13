//
//  CTCollectionViewItem.h
//  CTCollectionViewDelegateDemo
//
//  Created by wenjie on 2017/9/12.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTCollectionViewItem : NSObject

@property (nonatomic, strong,) NSString *identifier;

@property (nonatomic, assign) CGSize size;

@end
