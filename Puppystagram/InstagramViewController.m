//
//  InstagramViewController.m
//  Puppystagram
//
//  Created by Ian MacKinnon on 2015-01-29.
//  Copyright (c) 2015 Ian MacKinnon. All rights reserved.
//

#import "InstagramViewController.h"
#import "UIImageView+WebCache.h"

@interface InstagramViewController ()

@end

@implementation InstagramViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.bigView sd_setImageWithURL:[NSURL URLWithString:self.imageUrl]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
