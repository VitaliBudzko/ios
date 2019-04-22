//
//  PNViewController.m
//  RSSchool_T4
//
//  Created by Sasha Dubikovskaya on 22.04.2019.
//  Copyright © 2019 iOSLab. All rights reserved.
//

#import "PNViewController.h"

@interface PNViewController () <UITextFieldDelegate>

@end

@implementation PNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDictionary *dictionary = @{@"7": [UIImage imageNamed:@"flag_RU.png"], @"7": [UIImage imageNamed:@"flag_KZ.png"], @"373": [UIImage imageNamed:@"flag_MD.png"], @"374": [UIImage imageNamed:@"flag_AM.png"], @"375": [UIImage imageNamed:@"flag_BY.png"], @"380": [UIImage imageNamed:@"flag_UA.png"], @"992": [UIImage imageNamed:@"flag_TJ.png"], @"993": [UIImage imageNamed:@"flag_TM.png"], @"994": [UIImage imageNamed:@"flag_AZ.png"], @"996": [UIImage imageNamed:@"flag_KG.png"], @"998": [UIImage imageNamed:@"flag_UZ.png"]};
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 50, 390, 80)];
    view.layer.borderColor = [UIColor blackColor].CGColor;
    view.layer.borderWidth = 5.0f;
    view.layer.cornerRadius = 40.0f;
    view.tag = 1;
    [self.view addSubview:view];
    [view release];
    
    UIView *newView = [self.view viewWithTag:1];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 70, 50, 40)];
    imageView.layer.borderColor = [UIColor blueColor].CGColor;
    imageView.layer.borderWidth = 2.0f;
    imageView.layer.cornerRadius = 10.0f;
    imageView.tag = 2;
    [self.view addSubview:imageView];
    [imageView release];
    
    UIView *newImageView = [self.view viewWithTag:2];

    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(130, 70, 250, 40)];
    textField.textAlignment = NSTextAlignmentLeft;
    textField.textColor = [UIColor blackColor];
    textField.font = [UIFont fontWithName:@"Symbol" size:20];
    textField.placeholder = @"Enter phone number";
    textField.tag = 3;
    
    CALayer* line  = [CALayer layer];
    line.frame = CGRectMake(textField.bounds.origin.x, textField.bounds.origin.y + textField.bounds.size.height - 3, textField.frame.size.width, 2.f);
    line.borderWidth = 4.f;
    line.borderColor = [UIColor blueColor].CGColor;
    [textField.layer addSublayer:line];
    
    [self.view addSubview:textField];
    [textField release];
    
    UITextField *newTextField = [self.view viewWithTag:3];
    newTextField.keyboardType = UIKeyboardTypePhonePad;
    
    NSString *phoneNumberFormat = @"+[0-9]{3}([0-9]{2})[0-9]{3}-[0-9]{3}";
    if (![newTextField.text isEqualToString:@""]) {
        NSRange r = [newTextField.text rangeOfString:phoneNumberFormat options:NSRegularExpressionSearch];
        
        [phoneNumberFormat release];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
