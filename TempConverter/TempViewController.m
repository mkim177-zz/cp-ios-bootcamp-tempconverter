//
//  TempViewController.m
//  TempConverter
//
//  Created by mkim on 10/3/13.
//  Copyright (c) 2013 mkim. All rights reserved.
//

#import "TempViewController.h"

@interface TempViewController ()
@property (weak, nonatomic) IBOutlet UITextField *farenheitTextField;
@property (weak, nonatomic) IBOutlet UITextField *celciusTextField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UITextField *lastChanged;

- (IBAction)onChanged:(id)sender;
- (IBAction)onTap:(id)sender;
- (IBAction)onButtonPressed:(id)sender;
- (float) convertToCelcius:(float)farenheit;
- (float) convertToFarenheit:(float)celcius;
@end

@implementation TempViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onChanged:(id)sender {

    float farenheit = 0.0;
    float celcius = 0.0;
    
    UITextField *updated = (UITextField *) sender;
    
    if ([self.farenheitTextField isEqual:updated]) {
        self.lastChanged = self.farenheitTextField;
        farenheit = [self.farenheitTextField.text floatValue];
        celcius = [self convertToCelcius:farenheit];
    } else if ([self.celciusTextField isEqual:updated]) {
        self.lastChanged = self.celciusTextField;
        celcius = [self.celciusTextField.text floatValue];
        farenheit = [self convertToFarenheit:celcius];
    } else {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error"
                                message:@"What did you do?"
                                delegate: self
                                           cancelButtonTitle:@"I don't know!" otherButtonTitles:@"OK", nil];
        [av show];
    }
    
    self.farenheitTextField.text = [NSString stringWithFormat:@"%0.1f", farenheit];
    self.celciusTextField.text = [NSString stringWithFormat:@"%0.1f", celcius];
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onButtonPressed:(id)sender {
    [self onChanged:self.lastChanged];
}

- (float) convertToCelcius:(float)farenheit {
    //C = (F-32) * 5/9
    float celcius = (farenheit - 32.0) * 5/9;
    return celcius;
}
- (float) convertToFarenheit:(float)celcius {
    //F = (C * 9/5) + 32
    float farenheit = (celcius * 9/5) + 32;
    return farenheit;
}



@end
