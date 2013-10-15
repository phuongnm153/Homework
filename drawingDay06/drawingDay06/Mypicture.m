//
//  Mypicture.m
//  drawingDay06
//
//  Created by MAC on 10/15/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "Mypicture.h"

@implementation Mypicture
-(void) setWidth : (int) x andHeight : (int) y{
    self.Mywith = x;
    self.Myheight = y;
}
-(void) draw{
    for (int y = 0; y < self.Myheight; y++) {
        for (int x = 0; x < self.Mywith; x++) {
            if (x%10==y) {
                printf("\\");
            }
            else if (x%10+y == 9){
                printf("/");
            }
            else {
                printf(" ");
            }
            if (x==self.Mywith - 1){
                printf("\n");
            }
            
        }
    }
}
-(void) drawoto{
    for (int x =0;x<=15;x++) {
        if (7<=x && x <=15) {
            printf("_");
        }
        else{
            printf(" ");
        }
    }
    printf("\n");
    for (int x =0;x<=16;x++) {
        if (x==6) {
            printf("/");
        }
        else if (x==11){
            printf("|");
        }
        else if (x==16){
            printf("\\");
        }
        else{
            printf(" ");
        }
    }
    printf("\n");
    for (int x =0;x<=17;x++) {
        if (x==5) {
            printf("/");
        }
        else if (x==11){
            printf("|");
        }
        else if (x==17){
            printf("\\");
        }
        else{
            printf(" ");
        }
    }
    printf("\n");
    for (int x =0;x<=22;x++) {
        if (x==4) {
            printf("/");
        }
        else if (x==11){
            printf("|");
        }
        else if (x==18){
            printf("\\");
        }
        else if (x==0){
            printf(" ");
        }
        else{
            printf("_");
        }
    }
    printf("\n");
    for (int x =0;x<=23;x++) {
        if (x==0) {
            printf("|");
        }
        else if (x==23){
            printf("\\");
        }
        else {
            printf(" ");
        }
    }
    printf("\n");
    for (int x =0;x<=24;x++) {
        if (x==0) {
            printf("|");
        }
        else if (x==24){
            printf("\\");
        }
        else if (x==6 || x==7 ||x==17||x==18){
            printf("_");
        }
        else {
            printf(" ");
        }
    }
    printf("\n");
    for (int x =0;x<=25;x++) {
        if (x==0) {
            printf("|");
        }
        else if (x==5 || x==16){
            printf("/");
        }
        else if (x==8 || x==19 || x==25){
            printf("\\");
        }
        else{
            printf("_");
        }
    }
    printf("\n");
    for (int x =0;x<=25;x++) {
        if (x==0) {
            printf("\\");
        }
        else if (x==5 || x==8 || x==16 || x==19 || x==25){
            printf("|");
        }
        else{
            printf("-");
        }
    }
    printf("\n");
    for (int x =0;x<=19;x++) {
        if (x==5 || x==16) {
            printf("\\");
        }
        else if (x==8 || x==19){
            printf("/");
        }
        else{
            printf(" ");
        }
    }
    printf("\n");
    for (int x =0;x<=18;x++) {
        if (x==6 || x==7 ||x==17 || x==18) {
            printf("-");
        }
        else{
            printf(" ");
        }
    }
}
@end
