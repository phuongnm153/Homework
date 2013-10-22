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

    NSLog(@"Tong so tu duoc dung:%d",[set count]);
    
    NSMutableSet *set2 = [[NSMutableSet alloc] initWithObjects:@"a",@"an",@"and",@"but",@"by",@"me",@"have",@"has",@"if",@"it",@"in",@"is",@"or",@"of",@"for",@"the",@"to",@"wwith",nil];
    NSMutableArray *arrValue = [NSMutableArray new];
    NSMutableArray *arrIndex = [NSMutableArray new];
    for (id obj in set)
    {
        if (![set2 containsObject:obj]) {
            [arrValue addObject:obj];
            int i = [set countForObject:obj];
            [arrIndex addObject:[NSNumber numberWithInt:i]];
        }
    }
    for (int i =0; i< [arrIndex count] -1; i++) {
        for (int j = i+1;j< [arrIndex count];j++) {
            if ([arrIndex[i] integerValue] <[arrIndex[j] integerValue]) {
                [arrValue exchangeObjectAtIndex:i withObjectAtIndex:j];
                [arrIndex exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
    NSLog(@"Tu viet it nhat:%@ - so luong:%@", arrValue[[arrValue count]-1],arrIndex[[arrIndex count]-1]);
    NSLog(@"Tu viet nhieu nhat:%@ - so luong:%@", arrValue[0],arrIndex[0]);
    for (int i=0; i< [arrValue count]; i++) {
        NSLog(@"%@ --%@",arrValue[i],arrIndex[i]);
    }
}

@end
