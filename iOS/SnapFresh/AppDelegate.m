/*
 * Copyright 2012 Marco Abundo, Ysiad Ferreiras, Aaron Bannert, Jeremy Canfield and Michelle Koeth
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "AppDelegate.h"
#import "Constants.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    // Start the Google Analytics tracker
    [[GANTracker sharedTracker] startTrackerWithAccountID:kGANAccountId
                                           dispatchPeriod:kGANDispatchPeriodSec
                                                 delegate:nil];
    
    [[GANTracker sharedTracker] trackEvent:@"UIApplicationDelegate"
                                    action:@"didFinishLaunchingWithOptions"
                                     label:nil
                                     value:-1
                                 withError:nil];
    
    // Configure RestKit client
    [RKClient clientWithBaseURLString:kSnapFreshBaseURL];
    [[RKClient sharedClient] setTimeoutInterval:kSnapFreshTimeout];
    //[[RKClient sharedClient] setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    Class<RKParser> parser = [[RKParserRegistry sharedRegistry] parserClassForMIMEType:@"application/json"];
    [[RKParserRegistry sharedRegistry] setParserClass:parser forMIMEType:@"text/plain"];

    UIColor *color = [UIColor colorWithRed:0.39 green:0.60 blue:0.2 alpha:1.0];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;

        UINavigationController *navigationController = [splitViewController.viewControllers lastObject];

        splitViewController.delegate = (id)navigationController.topViewController;
    }
    
    [[UIToolbar appearance] setTintColor:color];
    [[UISearchBar appearance] setTintColor:color];

    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[GANTracker sharedTracker] trackEvent:@"UIApplicationDelegate"
                                    action:@"applicationDidEnterBackground"
                                     label:nil
                                     value:-1
                                 withError:nil];
    
    [[GANTracker sharedTracker] dispatchSynchronous:kGANDispatchPeriodSec];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[GANTracker sharedTracker] trackEvent:@"UIApplicationDelegate"
                                    action:@"applicationWillEnterForeground"
                                     label:nil
                                     value:-1
                                 withError:nil];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[GANTracker sharedTracker] trackEvent:@"UIApplicationDelegate"
                                    action:@"applicationDidBecomeActive"
                                     label:nil
                                     value:-1
                                 withError:nil];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [[GANTracker sharedTracker] trackEvent:@"UIApplicationDelegate"
                                    action:@"applicationWillResignActive"
                                     label:nil
                                     value:-1
                                 withError:nil];
}


- (void)applicationWillTerminate:(UIApplication *)application
{
    [[GANTracker sharedTracker] trackEvent:@"UIApplicationDelegate"
                                    action:@"applicationWillTerminate"
                                     label:nil
                                     value:-1
                                 withError:nil];
    
    [[GANTracker sharedTracker] dispatchSynchronous:kGANDispatchPeriodSec];
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    [[GANTracker sharedTracker] trackEvent:@"UIApplicationDelegate"
                                    action:@"applicationDidReceiveMemoryWarning"
                                     label:nil
                                     value:-1
                                 withError:nil];
}

@end