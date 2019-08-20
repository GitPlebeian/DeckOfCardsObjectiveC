//
//  JSTCardViewController.m
//  deckOfCardsObjectiveC
//
//  Created by Jackson Tubbs on 8/20/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

#import "JSTCardViewController.h"
#import "JSTCardController.h"

@interface JSTCardViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;
@property (weak, nonatomic) IBOutlet UILabel *cardSuitLabel;

@end

@implementation JSTCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

# pragma mark - Actions

- (IBAction)getNewCardButtonPressed:(id)sender {
    [JSTCardController fetchCardWithCompletion:^(JSTCard *card) {
        if (!card) {
            return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.cardSuitLabel.text = card.suit;
        });
        
        [JSTCardController fetchCardImageWithCard:card completion:^(UIImage *image) {
            if (!image) {
                return;
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.cardImageView.image = image;
            });
        }];
    }];
    
}

@end
