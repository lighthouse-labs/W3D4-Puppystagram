//
//  ViewController.m
//  Puppystagram
//
//  Created by Ian MacKinnon on 2015-01-29.
//  Copyright (c) 2015 Ian MacKinnon. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "InstagramCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "InstagramViewController.h"

@interface ViewController (){
    NSMutableArray *puppyArray;
    UICollectionViewFlowLayout *bigLayout;
    UICollectionViewFlowLayout *smallLayout;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    bigLayout = [[UICollectionViewFlowLayout alloc] init];
    bigLayout.itemSize = CGSizeMake(140, 140);
    bigLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    bigLayout.minimumInteritemSpacing = 10.0f;
    bigLayout.minimumLineSpacing = 10.0f;
    
    smallLayout = [[UICollectionViewFlowLayout alloc] init];
    smallLayout.itemSize = CGSizeMake(40, 40);
    smallLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    smallLayout.minimumInteritemSpacing = 10.0f;
    smallLayout.minimumLineSpacing = 10.0f;
    
    [self.collectionView setCollectionViewLayout:bigLayout];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://api.instagram.com/v1/tags/officedogs/media/recent?client_id=531009644bc8430a8ac8404c7d713317" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        puppyArray = [responseObject objectForKey:@"data"];
        
        [self.collectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Make Small" style:UIBarButtonItemStylePlain target:self action:@selector(makeSmall)];
    //[self.collectionView reloadData];
}

-(void) makeSmall{
    
    [smallLayout invalidateLayout];
    [self.collectionView setCollectionViewLayout:smallLayout];
    
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [puppyArray count];
}


-(UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *instagram = [puppyArray objectAtIndex:indexPath.row];
    
    InstagramCollectionViewCell *cell = (InstagramCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"InstagramCell" forIndexPath:indexPath];
    
    NSString *url = [[[instagram objectForKey:@"images"] objectForKey:@"low_resolution"] objectForKey:@"url"];
    
    
    [cell.instagramImageView sd_setImageWithURL:[NSURL URLWithString:url]];    
    
    return cell;
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *instagram = [puppyArray objectAtIndex:indexPath.row];
    
    NSString *url = [[[instagram objectForKey:@"images"] objectForKey:@"standard_resolution"] objectForKey:@"url"];
    
    InstagramViewController *instagramViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"instagramViewController"];
    
    instagramViewController.imageUrl = url;
    
    [self.navigationController pushViewController:instagramViewController animated:true];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
