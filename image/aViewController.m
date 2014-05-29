///Users/BSAUniv3/Desktop/image/image/aViewController.h
//  aViewController.m
//  image
//
//  Created by BSA Univ3 on 29/05/14.
//  Copyright (c) 2014 BSA Univ3. All rights reserved.
//

#import "aViewController.h"
#import "AppDelegate.h"
#import "Image.h"

@interface aViewController ()
{
    UIImage *image;
}
@property (nonatomic,strong) UIImage *imge1;
@end

@implementation aViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    _imge1=[UIImage imageNamed:
            @"love-wallpaper-free-download-windows-7.jpg"];
    [_img setImage:_imge1];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)save:(id)sender {
    _imge1=[UIImage imageNamed:@"love-wallpaper-free-download-windows-7.jpg"];
    
    NSString *path=[[NSBundle mainBundle]pathForResource:@"love-wallpaper-free-download-windows-7" ofType:@"jpg"];
    NSData *datapath=[NSData dataWithContentsOfFile:path];
    
    
    // NSData *data=[NSData dataWithContentsOfFile:@"beautiful_flowers_01_hd_pictures_166957.jpg"];
    
    
    // NSData *imagData= UIImageJPEGRepresentation(.imag, 1.0);
    NSLog(@"===>%@", datapath);
    //
    AppDelegate *delegateObj = [[UIApplication sharedApplication]delegate];
    
    _managedObjectContext = [delegateObj managedObjectContext];
    
    
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Image" inManagedObjectContext:_managedObjectContext];
    
    NSManagedObject *mangedObj = [[NSManagedObject alloc]initWithEntity:entityDesc insertIntoManagedObjectContext:_managedObjectContext];
    
    [mangedObj setValue:datapath forKey:@"pic"];
    
    NSError *error;
    
    [_managedObjectContext save:&error];
    
    NSLog(@"Image added into Coredata..");
    

}

- (IBAction)fetch:(id)sender {
    
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
    
    AppDelegate *appdel=[[UIApplication sharedApplication]delegate];
    _managedObjectContext = [appdel managedObjectContext];
    
    NSEntityDescription *entity1=[NSEntityDescription entityForName:@"Image" inManagedObjectContext:_managedObjectContext];
    
    
    [fetchRequest setEntity:entity1];
    
    NSError *error;
    NSArray *array1=[_managedObjectContext executeFetchRequest:fetchRequest error:&error];
    NSLog(@"00000000%@",array1);
       
    if (array1 == nil) {
        
        NSLog(@"Testing: No results found");
        
    }else {
        
        NSLog(@"Testing: %lu Results found.", (unsigned long)[array1 count]);
    }
   
    NSData * dataBytes = [[ array1 objectAtIndex:0]pic];
    
    
    image = [UIImage imageWithData:dataBytes];
    NSLog(@"====> %@", image);
    
    

}
@end
