//
//  UICollectionViewController.h
package objc.ios.ui;
//
//  Copyright (c) 2011 Apple Inc. All rights reserved.
//

#import <UIKit/UIViewController.h>
#import <UIKit/UICollectionView.h>
#import <UIKit/UIKitDefines.h>

@class UICollectionViewLayout;
@class UICollectionViewController;

NS_CLASS_AVAILABLE_IOS(6_0)extern class UICollectionViewController extends UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

- (id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout;

	public var UICollectionView *collectionView;
	public var BOOL clearsSelectionOnViewWillAppear; // defaults to YES, and if YES, any selection is cleared in viewWillAppear:

}
