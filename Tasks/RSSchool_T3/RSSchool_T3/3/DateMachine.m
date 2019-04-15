#import "DateMachine.h"

@implementation DateMachine

- (void)viewDidLoad {
  [super viewDidLoad];
  // have fun
    
    // Main label
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, 350, 50)];
    label.layer.borderColor = [UIColor grayColor].CGColor;
    label.layer.borderWidth = 1.0f;
    label.layer.cornerRadius = 10.0f;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.font = [UIFont fontWithName:@"Futura" size:25];
    label.numberOfLines = 1;
    label.tag = 1;
    [self.view addSubview:label];
    [label release];
    
    UILabel *existedLabel = [self.view viewWithTag:1];
    
    // Message label above "Start date"
    
    UILabel *firstMessageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, 350, 20)];
    firstMessageLabel.textAlignment = NSTextAlignmentCenter;
    firstMessageLabel.textColor = [UIColor redColor];
    firstMessageLabel.font = [UIFont fontWithName:@"Futura" size:17];
    firstMessageLabel.numberOfLines = 1;
    firstMessageLabel.text = @"Enter date in 'dd/MM/yyyy HH:mm' format";
    [self.view addSubview:firstMessageLabel];
    
    // Date information
    
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy HH:mm"];
    
    // Text field "Start date"
    
    UITextField *firstTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 160, 350, 40)];
    firstTextField.layer.borderColor = [UIColor greenColor].CGColor;
    firstTextField.layer.borderWidth = 1.0f;
    firstTextField.layer.cornerRadius = 10.0f;
    firstTextField.textAlignment = NSTextAlignmentCenter;
    firstTextField.textColor = [UIColor blackColor];
    firstTextField.font = [UIFont fontWithName:@"Symbol" size:20];
    firstTextField.placeholder = @"Start date";
    firstTextField.tag = 2;
    [self.view addSubview:firstTextField];
    [firstTextField release];
    
    UITextField *firstTF = [self.view viewWithTag:2];
    
    firstTF.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    
    if ([firstTF.text isEqualToString:@""]) {
        existedLabel.text = [dateFormat stringFromDate:date];
    } else {
        existedLabel.text = firstTF.text;
    }
    [dateFormat release];
    
    // Date format is checked
    
    NSString *firstDateMustBe = @"[0-3]{1}[0-9]{1}/[0-1]{1}[0-9]{1}/[0-9]{4} [0-2]{1}[0-3]{1}:[0-5]{1}[0-9]{1}";
    if (![firstTF.text isEqualToString:@""]) {
        NSRange r = [firstTF.text rangeOfString:firstDateMustBe options:NSRegularExpressionSearch];
        
    [firstDateMustBe release];
    [firstMessageLabel release];
    }
    
    // Message label above "Step"
    
    UILabel *secondMessageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 220, 350, 20)];
    secondMessageLabel.textAlignment = NSTextAlignmentCenter;
    secondMessageLabel.textColor = [UIColor redColor];
    secondMessageLabel.font = [UIFont fontWithName:@"Futura" size:17];
    secondMessageLabel.numberOfLines = 1;
    secondMessageLabel.text = @"Enter numbers";
    [self.view addSubview:secondMessageLabel];
    
    // Text field "Step"

    UITextField *secondTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 260, 350, 40)];
    secondTextField.layer.borderColor = [UIColor greenColor].CGColor;
    secondTextField.layer.borderWidth = 1.0f;
    secondTextField.layer.cornerRadius = 10.0f;
    secondTextField.textAlignment = NSTextAlignmentCenter;
    secondTextField.textColor = [UIColor blackColor];
    secondTextField.font = [UIFont fontWithName:@"Symbol" size:20];
    secondTextField.placeholder = @"Step";
    
    secondTextField.tag = 3;
    [self.view addSubview:secondTextField];
    [secondTextField release];
    
    UITextField *secondTF = [self.view viewWithTag:3];
    secondTF.keyboardType = UIKeyboardTypeNumberPad;
    
    // secondTextField date format is checked
    
    NSString *secondDateMustBe = @"[0-9]{20}";
    if (![secondTF.text isEqualToString:@""]) {
        NSRange r = [secondTF.text rangeOfString:secondDateMustBe options:NSRegularExpressionSearch];
        [secondDateMustBe release];
        [secondMessageLabel release];
    }
    
    // Message label above "Date unit"

    
    UILabel *tnirdMessageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 320, 350, 20)];
    tnirdMessageLabel.textAlignment = NSTextAlignmentCenter;
    tnirdMessageLabel.textColor = [UIColor redColor];
    tnirdMessageLabel.font = [UIFont fontWithName:@"Futura" size:17];
    tnirdMessageLabel.numberOfLines = 0;
    tnirdMessageLabel.text = @"Enter a word: year, month, day, hour or minute";
    [self.view addSubview:tnirdMessageLabel];
    
    // Text field "Date unit"

    UITextField *thirdTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 360, 350, 40)];
    thirdTextField.layer.borderColor = [UIColor greenColor].CGColor;
    thirdTextField.layer.borderWidth = 1.0f;
    thirdTextField.layer.cornerRadius = 10.0f;
    thirdTextField.textAlignment = NSTextAlignmentCenter;
    thirdTextField.textColor = [UIColor blackColor];
    thirdTextField.font = [UIFont fontWithName:@"Symbol" size:20];
    thirdTextField.placeholder = @"Date unit";
    
    thirdTextField.tag = 4;
    [self.view addSubview:thirdTextField];
    [thirdTextField release];
    
    UITextField *thirdTF = [self.view viewWithTag:4];
    
    // addButton

    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 430, 100, 50)];
    addButton.backgroundColor = [UIColor blueColor];
    addButton.layer.cornerRadius = 20;
    [addButton setTitle:@"Add" forState:UIControlStateNormal];
    
    [self.view addSubview:addButton];
    [addButton release];
    
    // subButton
    
    UIButton *subButton = [[UIButton alloc] initWithFrame:CGRectMake(260, 430, 100, 50)];
    subButton.backgroundColor = [UIColor blueColor];
    subButton.layer.cornerRadius = 20;
    [subButton setTitle:@"Sub" forState:UIControlStateNormal];
    
    [self.view addSubview:subButton];
    [subButton release];
    
}


 
@end
