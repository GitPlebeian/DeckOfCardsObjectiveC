//
//  JSTCardController.m
//  deckOfCardsObjectiveC
//
//  Created by Jackson Tubbs on 8/20/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

#import "JSTCardController.h"

@implementation JSTCardController

+ (void)fetchCardWithCompletion:(void (^)(JSTCard * _Nullable))completion
{
    NSURL *baseURL = [[NSURL alloc] initWithString:@"https://deckofcardsapi.com/api/deck/new/draw/"];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:false];
    NSURLQueryItem *queryItem = [[NSURLQueryItem alloc] initWithName:@"count" value:@"1"];
    components.queryItems = [NSArray<NSURLQueryItem *> arrayWithObjects:queryItem, nil];
    NSURL *finalURL = components.URL;
    
    NSLog(@"Final URL: %@", finalURL.absoluteString);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"Error %@, Localized Description %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            completion(nil);
            return;
        }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        JSTCard *decodedCard = [[JSTCard alloc] initWithDictionary:topLevelDictionary];
        
        completion(decodedCard);
    }] resume];
}

+ (void)fetchCardImageWithCard:(JSTCard *)card completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *finalURL = [[NSURL alloc] initWithString:card.imgURL];
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"Error %@, Localized Description %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            completion(nil);
            return;
        }
        
        UIImage *cardImage = [[UIImage alloc] initWithData:data];
        
        completion(cardImage);
    }] resume];
}

@end
