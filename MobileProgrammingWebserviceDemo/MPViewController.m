//
//  MPViewController.m
//  MobileProgrammingWebserviceDemo
//
//  Created by Vishal Lohia on 4/29/14.
//  Copyright (c) 2014 MobileProgramming. All rights reserved.
//

#import "MPViewController.h"
#import "SOAPEnvelope.h"

@interface MPViewController ()

@end

#define SERVER @"http://70.38.37.105:1049/Services/mobile/token/Default.aspx"
@implementation MPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //call Soap web Services
    
    /*
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"FXO-01@cheetah.com",@"1234567890",nil]
                                                     forKeys:[NSArray arrayWithObjects:@"emailAddress",@"phoneNum",nil]];
    NSString *envolop = [SOAPEnvelope soapEnvelopeWithMethod:@"CTRWS_UserRegister" andParameter:dict];
    NSLog(@"%@",envolop);
    WebserviceInputParameter *inputParam = [[WebserviceInputParameter alloc] init];
    inputParam.webserviceRelativePath = SERVER;
    inputParam.serviceMethodType = WEBSERVICE_METHOD_TYPE_POST;
    [WebserviceHelper callSoapWebserviceWithInputParameter:inputParam andSoapString:envolop success:^(id response) {
        if (response) {
            NSLog(@"%@",response);
            if ([response isKindOfClass:[NSData class]]) {
                NSString *str = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
                NSLog(@"%@",str);
            }
        }
        
    } error:^(NSError *error) {
        NSLog(@"%@",error.description);
    } complitionHandler:nil];
    */
    
    
    
     
     WebserviceInputParameter *inputParam = [[WebserviceInputParameter alloc] init];
     inputParam.webserviceRelativePath = SERVER;
     inputParam.serviceMethodType = WEBSERVICE_METHOD_TYPE_POST;
     
    [inputParam.dict_postParameters setObject:@"rtest"
                                      forKey:@"UserId"];

    [inputParam.dict_postParameters setObject:@"password"
                                       forKey:@"Password"];
typedef void (^successBlock)(id response);
   
    [WebserviceHelper callJSONWebServiceWithInputParameter:inputParam
                                                   success:^(id response) {
                                                       NSLog(@"%@",response);
                                                       
                                                   } error:^(NSError *error, id JSON) {
                                                       NSLog(@"%@",error.description);
                                                   }];
    
    
    [WebserviceHelper callWebserviceWithInputParameter:inputParam
                                               success:^(id response) {
                                                   if (response) {
                                                   NSLog(@"%@",response);
                                                       
                                                       if ([response isKindOfClass:[NSData class]]) {
                                                           
                                                           NSString *str = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
                                                           NSLog(@"%@",str);
                                                           
                                                       }
                                                       
                                                       
                                                   }
                                                   
                                               } error:^(NSError *error) {
                                                   
                                                   NSLog(@"%@",error.description);
                                               }];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
