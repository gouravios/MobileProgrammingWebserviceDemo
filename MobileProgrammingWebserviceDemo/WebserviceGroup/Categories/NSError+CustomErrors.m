//
//  NSError+CustomErrors.m
//  MobileProgramming
//
//  Created by Vishal Lohia on 3/15/14.
//  Copyright (c) 2014 a1. All rights reserved.
//

#import "NSError+CustomErrors.h"

const int ERROR_CODE_NO_NETWORK = 12346;
@implementation NSError (CustomErrors)

+(NSError *) noNetworkError
{

    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:LOCALISE_STRING(@"Alert.NoNetwork.Message") forKey:NSLocalizedDescriptionKey];
    [dict setObject:LOCALISE_STRING(@"Alert.NoNetwork.Title") forKey:NSMachErrorDomain];
    
    NSError *error = [[NSError alloc] initWithDomain:LOCALISE_STRING(@"Alert.NoNetwork.Title")
                                                code:ERROR_CODE_NO_NETWORK
                                            userInfo:dict];
    return error;
}

@end
