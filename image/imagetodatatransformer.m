//
//  imagetodatatransformer.m
//  image
//
//  Created by BSA Univ3 on 29/05/14.
//  Copyright (c) 2014 BSA Univ3. All rights reserved.
//

#import "imagetodatatransformer.h"

@implementation imagetodatatransformer
+ (BOOL)allowsReverseTransformation {
	return YES;
}

+ (Class)transformedValueClass {
	return [NSData class];
}

- (id)transformedValue:(id)value {
	NSData *data = UIImagePNGRepresentation(value);
	return data;
}

- (id)reverseTransformedValue:(id)value {
    
	UIImage *storedImage = [[UIImage alloc] initWithData:value];
    UIImage *img1 = obj.img.image;
    NSData *imagData=UIImageJPEGRepresentation(img1, 1.0);
    // NSData *imgData = [UIImageJPEGRepresentation(img1, 1.0)];
    
    [NSManagedObject  setValue:imagData forKey:@"imageview"];
    
    
    return storedImage;
}


@end
