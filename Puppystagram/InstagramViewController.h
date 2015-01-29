//
//  InstagramViewController.h
//  Puppystagram
//
//  Created by Ian MacKinnon on 2015-01-29.
//  Copyright (c) 2015 Ian MacKinnon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstagramViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *bigView;

@property (nonatomic, strong) NSString *imageUrl;

@end
