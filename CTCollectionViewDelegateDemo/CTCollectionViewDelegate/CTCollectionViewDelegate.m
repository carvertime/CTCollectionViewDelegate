//
//  CTCollectionViewDelegate.m
//  CTCollectionViewDelegateDemo
//
//  Created by wenjie on 2017/9/12.
//  Copyright © 2017年 Demo. All rights reserved.
//

#import "CTCollectionViewDelegate.h"
#import "CTCollectionViewSection.h"
#import "CTCollectionViewItem.h"
#import "CTCollectionViewCell.h"
#import "CTCollectionReusableView.h"

@implementation CTCollectionViewDelegate

#pragma mark - pulic func get item & section

- (CTCollectionViewItem *)getHeaderAtIndex:(NSInteger)index{
    return [self getSectionAtIndex:index].header;
}

- (CTCollectionViewItem *)getItemAtIndexPath:(NSIndexPath *)indexPath{
    CTCollectionViewSection *section = [self getSectionAtIndex:indexPath.section];
    if (indexPath.item >= section.items.count) {
        return nil;
    }
    return section.items[indexPath.item];
}

- (CTCollectionViewSection *)getSectionAtIndex:(NSInteger)index{
    if (index >= self.sections.count) {
        return nil;
    }
    return self.sections[index];
}

#pragma mark - UICollectionViewDataSource & UICollectionViewDelegateFlowLayout

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CTCollectionViewItem *item = [self getItemAtIndexPath:indexPath];
    NSAssert([item isKindOfClass:CTCollectionViewItem.class], @"item=%@", item);
    CTCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:item.identifier forIndexPath:indexPath];
    NSAssert(cell != nil, @"cell should not be nil, identifier=%@",item.identifier);
    [cell updateWithCellData:item atIndexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    CTCollectionViewItem *item = nil;
    CTCollectionViewSection *section = [self getSectionAtIndex:indexPath.section];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        item = (CTCollectionViewItem *)section.header;
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        item = (CTCollectionViewItem *)section.footer;
    }
    NSAssert([item isKindOfClass:CTCollectionViewItem.class], @"item=%@", item);
    CTCollectionReusableView * supplementaryView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:item.identifier forIndexPath:indexPath];
    NSAssert(supplementaryView != nil, @"supplementaryView should not be nil, identifier=%@", item.identifier);
    supplementaryView.delegate = self;
    [supplementaryView updateWithCellData:item];
    return supplementaryView;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.sections[section].items.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.sections.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return [self getSectionAtIndex:section].header.size;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CTCollectionViewItem *item = [self getItemAtIndexPath:indexPath];
    return item.size;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return [self getSectionAtIndex:section].footer.size;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return [self getSectionAtIndex:section].minimumLineSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return [self getSectionAtIndex:section].minimumInteritemSpacing;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return [self getSectionAtIndex:section].insets;
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    BOOL response = [super respondsToSelector:aSelector];
    if (!response) {
        response = [self.owner respondsToSelector:aSelector];
    }
    return response;
}
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    __strong id forwardingTarget = self.owner;
    if (forwardingTarget && [forwardingTarget respondsToSelector:aSelector]) {
        return forwardingTarget;
    }
    return [super forwardingTargetForSelector:aSelector];
}


@end
