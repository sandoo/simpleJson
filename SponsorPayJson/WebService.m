//
//  WebService.m
//  SponsorPayJson
//
//  Created by davut on 3.04.2014.
//  Copyright (c) 2014 davut. All rights reserved.
//

#import "WebService.h"

@implementation WebService



-(void)getRequestWithPath:(NSString*)path success:(void(^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))successBlock failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))faultBlock
{
    RKObjectManager *objectManager = [RKObjectManager sharedManager];
    
    
    [objectManager getObjectsAtPath:path
                         parameters:nil
                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                
                                //loader kaldır
                                if(successBlock)
                                    successBlock(operation, mappingResult);
                            }
                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                
                                if(faultBlock)
                                    faultBlock(operation, error);
                            }];
}


-(void)initObjectManagerWithPath:(NSString*)path
{

    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    NSString *stringUrl = @"http://api.sponsorpay.com/feed";
    NSURL *baseURL = [NSURL URLWithString:stringUrl];
    AFHTTPClient * client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];

    [client setDefaultHeader:@"Content-Type" value:@"application/json"];
    [client setDefaultHeader:@"Accept-Encoding" value:@"gzip, deflate"];
    [client setDefaultHeader:@"Accept" value:RKMIMETypeJSON];
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    
    
    [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/html"];

    [[RKObjectManager alloc] initWithHTTPClient:client];
    }


-(NSString*)GetDataWithsuccess:(void (^)(RKObjectRequestOperation *, RKMappingResult *))successBlock failure:(void (^)(RKObjectRequestOperation *, NSError *))faultBlock
{
    NSString *path = [self buildPath];
    [self initObjectManagerWithPath:path];
    [MappingManager mapForItems];
    [self getRequestWithPath:path success:successBlock failure:faultBlock];
    return path;
}

-(NSString *)buildPath
{
    NSString *currentTimestamp = [NSString stringWithFormat:@"%.0f", [[NSDate date] timeIntervalSince1970]];
    
    NSString *apiKey = @"&1c915e3b5d42d05136185030892fbb846c278927";
    NSString *query = [NSString stringWithFormat:@"appid=2070&device=phone&device_id=648443a6e861ad788f0167684fca66f913eba47d&locale=en&offer_types=112,100,101,102,103,104,105,106,107,108,109,110,111&timestamp=%@&uid=spiderman",currentTimestamp];
    
    NSString *queryWithApi = [query stringByAppendingString:apiKey];
    NSString *hashed = [Cipher hex_sha1:queryWithApi];
    
    NSString *hashedQuery = [NSString stringWithFormat:@"%@&hashkey=%@",query,hashed];
    
    NSString *baseQueryStr = [NSString stringWithFormat:@"v1/offers.json?%@",hashedQuery];
    
    
    return baseQueryStr;
}




@end
