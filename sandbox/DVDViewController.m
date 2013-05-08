//
//  DVDViewController.m
//  sandbox
//
//  Created by Dvid Silva on 5/8/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import "DVDViewController.h"

@interface DVDViewController ()

@end

@implementation DVDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    //obtener la ruta al cache
    NSFileManager *fm = [NSFileManager defaultManager];
    NSURL *url = [[fm URLsForDirectory:NSCachesDirectory
                            inDomains:NSUserDomainMask
                  ]lastObject];
    
    //obtener la ruta al fichero
    url = [url URLByAppendingPathComponent:@"ejemplo.txt"];
    
    //guardamos
    NSError *err = nil;
    BOOL rc = NO;
    rc = [@"Hola Mundo" writeToURL:url
                        atomically:YES
                          encoding:NSUTF8StringEncoding
                             error:&err];
    //verificamos errores
    if(rc == NO){
        //Error
        NSLog(@"Error al Guardar: %@ %@",[err localizedDescription], [err userInfo]);
    }
    
    //leemos para asegurarnos que se guardo
    NSString *contenido = [NSString stringWithContentsOfURL:url
                                                   encoding:NSUTF8StringEncoding
                                                      error:&err];
    //Comprobamos que no haya habido error
    if(contenido == nil ){
        //error!
        NSLog(@"error al leer: %@ %@", [err localizedDescription], [err userInfo]);
    }
}
@end
