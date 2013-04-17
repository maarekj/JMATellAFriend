//
//  JMATellAFriend.h
//
//  Created by joseph maarek on 26/09/12.
//  Copyright (c) 2012 Joseph Maarek. All rights reserved.
//

#import "iTellAFriend.h"

@interface JMATellAFriend : iTellAFriend <UIActionSheetDelegate>
+ (JMATellAFriend *)sharedInstance;
- (void)rateThisAppWithRememberLater;
@end
