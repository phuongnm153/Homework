//
//  ViewController.m
//  Day07
//
//  Created by MAC on 10/18/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)readfile:(id)sender {
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"putin" ofType:@"txt"];
    NSError *error;
    NSString *fileContents = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:&error];
    
    if (error){
        NSLog(@"Error reading file: %@", error.localizedDescription);
    }

    NSArray *listArray = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet punctuationCharacterSet]];

    NSMutableArray *array = [NSMutableArray new];
    for (id obj in listArray){
        NSArray *temparr = [obj componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [array addObjectsFromArray:temparr];        
    }
    [array removeObject:@""];
    NSCountedSet *set = [NSCountedSet new];
    [set addObjectsFromArray:array];
    int max = 0;int min = INT16_MAX;
    id omax;id omin;
    for (id obj in set) {
        if (min > [set countForObject:obj]) {
            min =[set countForObject:obj];
            omin = obj;
        }
        if (max < [set countForObject:obj]) {
            max =[set countForObject:obj];
            omax = obj;
        }
    }
    NSLog(@"Tong so tu duoc dung:%d",[set count]);
    NSLog(@"Tu viet it nhat:%@ - so luong:%d", omin,min);
    NSLog(@"Tu viet nhieu nhat:%@ - so luong:%d", omax,max);
    NSMutableSet *set1 = [[NSMutableSet alloc] initWithArray:array];
    NSMutableSet *set2 = [[NSMutableSet alloc] initWithObjects:@"a",@"an",@"and",@"but",@"the",@"to",@"me",@"have",@"has",@"of",@"if",@"it",nil];
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in set1)
    {
        if (![set2 containsObject:obj]) {
            [arr addObject:obj];
        }
    }
    NSLog(@"Cac tu khoa:%@",arr);
}

@end
