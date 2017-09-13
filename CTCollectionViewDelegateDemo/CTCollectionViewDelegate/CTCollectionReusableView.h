//
//  CTCollectionReusableView.h
//  CTCollectionViewDelegateDemo
//
//  Created by wenjie on 2017/9/13.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTCollectionReusableView : UICollectionReusableView

@property (nonatomic, weak) id delegate;

- (void)updateWithCellData:(id)data;

@end
