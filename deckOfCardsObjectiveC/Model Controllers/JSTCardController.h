//
//  JSTCardController.h
//  deckOfCardsObjectiveC
//
//  Created by Jackson Tubbs on 8/20/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSTCard.h"
#import <UIKit/UIKit.h>


@interface JSTCardController : NSObject

+ (void) fetchCardWithCompletion:(void (^) (JSTCard *))completion;
+ (void) fetchCardImageWithCard:(JSTCard *)card completion:(void (^) (UIImage *))completion;

@end

