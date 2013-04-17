//
//  JMATellAFriend.m
//  MaguenAvot
//
//  Created by joseph maarek on 26/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JMATellAFriend.h"

@implementation JMATellAFriend

#define kAlertViewRememberLaterTag  10
#define kDontRemind                 @"DontRemind"
#define kAlreadyRated               @"AlreadyRated"
#define kRemindLater                @"RemindLater"
#define kMaxCountTime               4

static JMATellAFriend *sharedInstance = nil;
static NSString *const JMATellAFriendRememberKey = @"JMATellAFriendRememberKey";
static NSString *const JMATellAFriendCountTimeKey = @"JMATellAFriendCountTimeKey";

+ (JMATellAFriend *)sharedInstance
{
	@synchronized(self) {
		if (sharedInstance == nil) {
			sharedInstance = [[self alloc] init];
		}
	}
	return sharedInstance;
}

- (void)rateThisAppWithRememberLater
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger countTime = [defaults integerForKey:JMATellAFriendCountTimeKey];
    
    if (countTime < kMaxCountTime) {
        [defaults setInteger:countTime + 1 forKey:JMATellAFriendCountTimeKey];
        [defaults synchronize];
    } else {
        NSString *rememberKey = [defaults stringForKey:JMATellAFriendRememberKey];
        if ([rememberKey isEqualToString:kRemindLater] || rememberKey == nil) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Rate This App", @"")
                                                                message:[NSString stringWithFormat:NSLocalizedString(@"If you enjoy using %@, would you mind taking a moment to rate it? It won't take more than a minute. Thanks for your support!", @""), self.applicationName] 
                                                               delegate:self
                                                      cancelButtonTitle:NSLocalizedString(@"Remind later", @"")
                                                      otherButtonTitles:NSLocalizedString(@"Rate now", @""), NSLocalizedString(@"Don't remind me", @""), nil];
            alertView.tag = kAlertViewRememberLaterTag;
            alertView.delegate = self;
            [alertView show];
        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == kAlertViewRememberLaterTag) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if (buttonIndex == 0) {
            [defaults setObject:kRemindLater forKey:JMATellAFriendRememberKey];
            [defaults synchronize];
        } else if (buttonIndex == 2) {
            [defaults setObject:kDontRemind forKey:JMATellAFriendRememberKey];
            [defaults synchronize];
        } else if (buttonIndex == 1) {
            [defaults setObject:kAlreadyRated forKey:JMATellAFriendRememberKey];
            [defaults synchronize];
            [self rateThisApp];
        }
    } else {
        [super alertView:alertView clickedButtonAtIndex:buttonIndex];
    }
}

@end
