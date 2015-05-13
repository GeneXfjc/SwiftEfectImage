//
//  EfectOpenCV.m
//  EfectImage
//
//  Created by fujic on 2015/05/11.
//  Copyright (c) 2015年 Yapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "EfectImage01-Bridging-Header.h"

#import <opencv2/opencv.hpp>
#import <opencv2/highgui/ios.h>

@implementation EfectOpenCV : NSObject
+(UIImage *)DetectEdgeWithImage:(UIImage *)image{
    //UIImage to cv::Mat
    cv::Mat cvMat;
    UIImageToMat(image,cvMat);
    //Efecting
    cv::Mat gray;
    cv::cvtColor(cvMat, gray, CV_BGR2GRAY);
    
    //Edge
    cv::Mat edge;
    cv::Canny(gray, edge, 20, 80);
    //cv::Mat to UIImage
    UIImage *edgeImg = MatToUIImage(edge);
    return edgeImg;
}
@end
