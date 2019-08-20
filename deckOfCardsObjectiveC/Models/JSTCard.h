//
//  JSTCard.h
//  deckOfCardsObjectiveC
//
//  Created by Jackson Tubbs on 8/20/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSTCard : NSObject

@property (nonatomic, readonly, copy) NSString *suit;
@property (nonatomic, readonly, copy) NSString *imgURL;

- (instancetype) initWithSuitName:(NSString *)suit imgURL:(NSString *)imgURL;

@end

@interface JSTCard (JSONConvertable)

- (instancetype) initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
