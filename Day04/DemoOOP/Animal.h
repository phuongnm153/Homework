//
//  Animal.h
//  DemoOOP
//
//  Created by techmaster on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject
{
    //Khai báo instant variable
    @public  //có thể nhìn thấy ở khắp nơi
    NSString * _id; //Mã số phân biệt trong cơ sở dữ liệu
    NSMutableArray *_voice;
    NSMutableArray *_posture; // Anh cua tung dong tac
    
    @protected
    BOOL _moveable;
    
    
}
//Cách khai báo property ~ thuộc tính. Ánh xạ vào biến thành phần có các property attribute để thay đổi tính chất của thuộc tính.

//Thuộc tính sẽ sinh ra getter và setter function trong khi đó biến thành phần rất đơn giản
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *origin;
@property(nonatomic,assign) int priceAnimal;
- (id) initWithName: (NSString*) name;
-(id) initWithName:(NSString *)name andOrigin:(NSString*) origin;

-(id) initWithName:(NSString *)name andOrigin:(NSString*) origin andPrice: (int) priceAnimal;
@end
