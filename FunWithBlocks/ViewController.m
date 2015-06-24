//
//  ViewController.m
//  FunWithBlocks
//
//  Created by Andres Kwan on 6/24/15.
//  Copyright (c) 2015 Kwan Castle. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

typedef int (^IntBlock)(int);

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self declareAndCallBlock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)declareAndCallBlock
{
    IntBlock squareBlock =  ^int(int number){
        return number * number;
    };
    NSLog(@"Block return value: %d",squareBlock(7));
}

@end
