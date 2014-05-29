//
//  aViewController.h
//  image
//
//  Created by BSA Univ3 on 29/05/14.
//  Copyright (c) 2014 BSA Univ3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface aViewController : UIViewController
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) IBOutlet UIImageView *img;

- (IBAction)save:(id)sender;
- (IBAction)fetch:(id)sender;

@end
