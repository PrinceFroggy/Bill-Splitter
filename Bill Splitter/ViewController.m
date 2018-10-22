//
//  ViewController.m
//  Bill Splitter
//
//  Created by Andrew Solesa on 2017-03-18.
//  Copyright © 2017 KSG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *totalAmount;
@property (weak, nonatomic) IBOutlet UISlider *peopleSlider;
@property (weak, nonatomic) IBOutlet UILabel *labelPeople;
@property (weak, nonatomic) IBOutlet UILabel *labelBill;
@property NSDecimalNumber *billTotal;
@property NSDecimalNumber *people;
@property int peopleInt;
@property NSDecimalNumber *total;
@property Tip *tip;
@property NSNumberFormatter *formatTotal;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tip = [[Tip alloc] init];
    _formatTotal = [[NSNumberFormatter alloc] init];
    [_formatTotal setNumberStyle:NSNumberFormatterCurrencyPluralStyle];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)peopleSlider:(UISlider *)sender
{
    self.peopleInt = self.peopleSlider.value;
    
    self.labelPeople.text = [NSString stringWithFormat:@"Amount of people: %d", self.peopleInt];
    
    self.billTotal = [[NSDecimalNumber alloc] initWithInt:[self.totalAmount.text intValue]];
    self.people = [[NSDecimalNumber alloc] initWithInt:self.peopleInt];
    
    self.total = [self.tip calculateAmount:self.billTotal numberOfPeople:self.people];
    
    self.labelBill.text = [NSString stringWithFormat:@"Total Bill: %@", [self.formatTotal stringFromNumber:self.total]];
}

- (IBAction)calculateSplitAmount:(UIButton *)sender
{
    if ((self.totalAmount.text.length > 0 && self.totalAmount.text != nil && ![self.totalAmount.text isEqual:@""]))
    {
        self.peopleInt = self.peopleSlider.value;
        
        self.billTotal = [[NSDecimalNumber alloc] initWithInt:[self.totalAmount.text intValue]];
        self.people = [[NSDecimalNumber alloc] initWithInt:self.peopleInt];
        
        self.total = [self.tip calculateAmount:self.billTotal numberOfPeople:self.people];
        
        self.labelBill.text = [NSString stringWithFormat:@"Total Bill: %@", [self.formatTotal stringFromNumber:self.total]];
    }
}

@end
