//
//  MainMenuViewController.m
//  Alcolator
//
//  Created by Ricardo Gonzalez on 9/24/14.
//  Copyright (c) 2014 Bloc. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()

@property (weak, nonatomic) UIButton *wineButton;
@property (weak, nonatomic) UIButton *whiskeyButton;

@end

@implementation MainMenuViewController

- (void)loadView {
    self.view = [[UIView alloc] init];
    
    // Initialize instance variables
    UIButton *wine = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *whiskey = [UIButton buttonWithType:UIButtonTypeSystem];
    
    // Add buttons to subview
    [self.view addSubview:wine];
    [self.view addSubview:whiskey];
    
    // Assign views to properties
    self.wineButton = wine;
    self.whiskeyButton = whiskey;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // Delegating button taps to methods
    [self.wineButton addTarget:self action:@selector(winePressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.whiskeyButton addTarget:self action:@selector(whiskeyPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.wineButton setTitle:NSLocalizedString(@"Wine", @"Grape alcoholic beverage") forState:UIControlStateNormal];
    
    [self.whiskeyButton setTitle:NSLocalizedString(@"Whiskey", @"whiskey") forState:UIControlStateNormal];
    self.title = NSLocalizedString(@"Select Alcolator", @"Select option");
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGFloat viewWidth = self.view.bounds.size.width;
    CGFloat viewHeight = self.view.bounds.size.height;
    CGFloat paddingWidth = (CGFloat)(viewWidth * 0.0625);
    CGFloat itemHeight = 44;
    
    self.wineButton.frame = CGRectMake(paddingWidth, (viewHeight / 2) - itemHeight, viewWidth / 3, itemHeight);
    
    self.whiskeyButton.frame = CGRectMake((viewWidth / 2) + paddingWidth, (viewHeight / 2) - itemHeight, viewWidth / 3, itemHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) winePressed:(UIButton *) sender {
    ViewController *wineVC = [[ViewController alloc] init];
    [self.navigationController pushViewController:wineVC animated:YES];
}

- (void) whiskeyPressed:(UIButton *) sender {
    WhiskeyViewController *whiskeyVC = [[WhiskeyViewController alloc] init];
    [self.navigationController pushViewController:whiskeyVC animated:YES];
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
