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
    [self usingInlineBlock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)usingInlineBlock
{
    NSArray * arrayOfNames = @[@"Andrea",@"Paula",@"Sandra",@"Monica",@"Carolina",@"Candy",@"Jenny"];
    [arrayOfNames enumerateObjectsUsingBlock:^(id name, NSUInteger idx, BOOL *stop) {
        if (idx == 3) {
            NSLog(@"stop value: %@",*stop?@"YES":@"NO");
            *stop = YES;
            NSLog(@"stop value: %@",*stop?@"YES":@"NO");
        }
        NSLog(@"Index %lu, Name: %@.",(unsigned long)idx,[name uppercaseString]);
        NSLog(@"stop value: %d",*stop);
        NSLog(@"%lu",(unsigned long)idx);
    }];
}

- (void)declareAndCallBlock
{
    IntBlock squareBlock =  ^int(int number){
        return number * number;
    };
    NSLog(@"Block return value: %d",squareBlock(7));
}

- (void)shareScopeVars {
    __block NSString *weather = @"Rainy";
    NSLog(@"Weather before block: %@", weather);
    
    void (^changeWeather)(void) = ^{
        weather = @"Sunny";
        NSLog(@"Weather inside block: %@",weather);
    };
    
    changeWeather();
}

@end
