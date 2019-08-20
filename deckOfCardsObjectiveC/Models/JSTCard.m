//
//  JSTCard.m
//  deckOfCardsObjectiveC
//
//  Created by Jackson Tubbs on 8/20/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

#import "JSTCard.h"


static NSString * const cardsKey = @"cards";
static NSString * const imageKey = @"image";
static NSString * const suitKey = @"suit";

@implementation JSTCard

- (instancetype)initWithSuitName:(NSString *)suit imgURL:(NSString *)imgURL
{
    self = [super init];
    if (self != nil)
    {
        _suit = suit;
        _imgURL = imgURL;
    }
    return self;
}

@end

@implementation  JSTCard (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *suit = dictionary[cardsKey][0][suitKey];
    NSString *imgURL = dictionary[cardsKey][0][imageKey];
    
    if (![suit isKindOfClass:[NSString class]] || ![imgURL isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    return [self initWithSuitName:suit imgURL:imgURL];
}

@end
