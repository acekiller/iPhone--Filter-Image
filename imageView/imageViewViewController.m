//
//  imageViewViewController.m
//  imageView
//
//  Created by Hung Phi on 7/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "imageViewViewController.h"
#import "QuartzCore/QuartzCore.h"

@implementation imageViewViewController

@synthesize imageLoad, imageFilter, scrollImage, imageView;
//@synthesize downButtonLayer,buttonNormal,buttonGray,buttonSepia,buttonNored,buttonQuartz;

- (void)dealloc
{
    [super dealloc];
    [scrollImage release];
	[imageView release];
	[imageLoad release];
	[imageFilter release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    NSLog(@"did load");
    [super viewDidLoad];
    
    //Add frame boder : 
    UIImageView *imgBoder = [[UIImageView alloc] initWithFrame:CGRectMake(9, 53, 302, 302)] ;
    imgBoder.image = [UIImage imageNamed:@"frame_boder.png"];
    [self.view addSubview:imgBoder];
    [imgBoder release];
    
    //add image view: 
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 56, 292, 292)] ;
    imageLoad = [UIImage imageNamed:@"image.jpg"];
    [self.imageView setImage:imageLoad];
    [self.view addSubview:imageView];
    
    //Load ScrollView : 
    [scrollImage setContentSize:CGSizeMake(640, 95)];
    [scrollImage setBackgroundColor:[UIColor blackColor]]; 
    //[UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0.5]];
    [self.view addSubview:scrollImage];
    
    //320  = 5*2 + 50*5 + 15*4     
    NSInteger space = 5;
    [UIImage imageNamed:@"demo.png"];
    
    //Filter Image : Normal
//    UIButton *buttonNormal = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonNormal = [[UIButton alloc] init];
    buttonLayer = [buttonNormal layer];
    [buttonLayer setMasksToBounds:YES];
    [buttonLayer setCornerRadius:5.0];
    [buttonLayer setBorderWidth:3.0];
    [buttonLayer setBorderColor:[[UIColor whiteColor] CGColor]];
    
    [buttonNormal setFrame:CGRectMake(space, 15, 50, 50)];
    [buttonNormal setImage:[UIImage imageNamed:@"normal.png"] forState:UIControlStateNormal];
    [buttonNormal addTarget:self action:@selector(clickNormal) forControlEvents:UIControlEventTouchUpInside];
    [scrollImage addSubview:buttonNormal];
    
    UILabel *labelNormal = [[UILabel alloc] initWithFrame:CGRectMake(space + 4, 70, 70, 11)];
    labelNormal .text = @"Normal";
    labelNormal .backgroundColor = [UIColor clearColor];
    labelNormal .textColor = [UIColor whiteColor];
    labelNormal .font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size: 11.0];
    [scrollImage addSubview:labelNormal ];
    
    //Filter Image : Graycale
 //   buttonGray = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonGray = [[UIButton alloc] init];
    buttonLayer = [buttonGray layer];
    [buttonLayer setMasksToBounds:YES];
    [buttonLayer setCornerRadius:5.0];
    [buttonLayer setBorderColor:[[UIColor whiteColor] CGColor]];
    
    [buttonGray setFrame:CGRectMake(space += 65, 15, 50, 50)];  
    [buttonGray setImage:[UIImage imageNamed:@"blackwhite.png"] forState:UIControlStateNormal];
	[buttonGray addTarget:self action:@selector(clickGray) forControlEvents:UIControlEventTouchUpInside];
    [scrollImage addSubview:buttonGray];
    
    UILabel *labelGraycale = [[UILabel alloc] initWithFrame:CGRectMake(space + 10, 70, 70, 11)];
    buttonLayer = [buttonNormal layer];
    [buttonLayer setMasksToBounds:YES];
    [buttonLayer setCornerRadius:5.0];
    labelGraycale.text = @"Gray";
    labelGraycale.backgroundColor = [UIColor clearColor];
    labelGraycale.textColor = [UIColor whiteColor];
    labelGraycale.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size: 11.0];
    [scrollImage addSubview:labelGraycale];
    
     //Filter Image : Sepia
 //   buttonSepia = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonSepia = [[UIButton alloc] init];
    buttonLayer = [buttonSepia layer];
    [buttonLayer setMasksToBounds:YES];
    [buttonLayer setCornerRadius:5.0];
    [buttonLayer setBorderColor:[[UIColor whiteColor] CGColor]];
    
    [buttonSepia setFrame:CGRectMake(space += 65, 15, 50, 50)];
    [buttonSepia setImage:[UIImage imageNamed:@"Sepia.png"] forState:UIControlStateNormal];
	[buttonSepia addTarget:self action:@selector(clickSepia) forControlEvents:UIControlEventTouchUpInside];
    [scrollImage addSubview:buttonSepia];
    
    UILabel *labelSepia = [[UILabel alloc] initWithFrame:CGRectMake(space + 10, 70, 70, 11)];
    labelSepia.text = @"Sepia";
    labelSepia.backgroundColor = [UIColor clearColor];
    labelSepia.textColor = [UIColor whiteColor];
    labelSepia.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size: 11.0];
    [scrollImage addSubview:labelSepia];   
    
     //Filter Image : Red 
 //   buttonNored = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonNored = [[UIButton alloc] init];
    buttonLayer = [buttonNored layer];
    [buttonLayer setMasksToBounds:YES];
    [buttonLayer setCornerRadius:5.0];
    [buttonLayer setBorderColor:[[UIColor whiteColor] CGColor]];
    
    [buttonNored setFrame:CGRectMake(space += 65, 15, 50, 50)];
    [buttonNored setImage:[UIImage imageNamed:@"red.png"] forState:UIControlStateNormal];
	[buttonNored addTarget:self action:@selector(clickNored) forControlEvents:UIControlEventTouchUpInside];
    [scrollImage addSubview:buttonNored];
    
    UILabel *labelNored = [[UILabel alloc] initWithFrame:CGRectMake(space + 13, 70, 70, 11)];
    labelNored.text = @"Nored";
    labelNored.backgroundColor = [UIColor clearColor];
    labelNored.textColor = [UIColor whiteColor];
    labelNored.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size: 11.0];
    [scrollImage addSubview:labelNored];    
	
    //Filter Image : Quartz
 //   buttonQuartz = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonQuartz = [[UIButton alloc] init];
    buttonLayer = [buttonQuartz layer];
    [buttonLayer setMasksToBounds:YES];
    [buttonLayer setCornerRadius:5.0];
    [buttonLayer setBorderColor:[[UIColor whiteColor] CGColor]];
    
    [buttonQuartz setFrame:CGRectMake(space += 65, 15, 50, 50)];
    [buttonQuartz setImage:[UIImage imageNamed:@"Quartz.png"] forState:UIControlStateNormal];
    [buttonQuartz addTarget:self action:@selector(clickQuartz) forControlEvents:UIControlEventTouchUpInside];
    [scrollImage addSubview:buttonQuartz];
    
    UILabel *labelQuartz = [[UILabel alloc] initWithFrame:CGRectMake(space + 5, 70, 70, 11)];
    labelQuartz.text = @"Quartz";
    labelQuartz.backgroundColor = [UIColor clearColor];
    labelQuartz.textColor = [UIColor whiteColor];
    labelQuartz.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size: 11.0];
    [scrollImage addSubview:labelQuartz];
    
     //Filter Image : Hue 
//    buttonHue = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonHue = [[UIButton alloc] init];
    buttonLayer = [buttonHue layer];
    [buttonLayer setMasksToBounds:YES];
    [buttonLayer setCornerRadius:5.0];
    [buttonLayer setBorderColor:[[UIColor whiteColor] CGColor]];
    
    [buttonHue setFrame:CGRectMake(space += 65, 15, 50, 50)];
    [buttonHue setImage:[UIImage imageNamed:@"hue.png"] forState:UIControlStateNormal];
    [buttonHue addTarget:self action:@selector(clickHue) forControlEvents:UIControlEventTouchUpInside];
    [scrollImage addSubview:buttonHue];
    
    UILabel *labelHue = [[UILabel alloc] initWithFrame:CGRectMake(space + 13, 70, 70, 11)];
    labelHue.text = @"Hue";
    labelHue.backgroundColor = [UIColor clearColor];
    labelHue.textColor = [UIColor whiteColor];
    labelHue.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size: 11.0];
    [scrollImage addSubview:labelHue];
    
    //End didload : 
    buttonLayer = [buttonNormal layer];

    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (UIImage *)rescaleImageToSize : (CGSize)size 
{
    CGRect rect = CGRectMake(0.0, 0.0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    UIImage *resImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resImage;
}

#pragma UIImage

- (IBAction)clickNormal
{
    NSLog(@"Normal");
    [buttonLayer setBorderWidth:0.0];
    buttonLayer  = buttonNormal.layer;
    [buttonLayer setBorderWidth:3.0];
    
    [imageView removeFromSuperview];
    [imageView setImage:imageLoad];
    [self.view addSubview:imageView];
}

- (IBAction)clickSepia
{
    NSLog(@"Sepia");
    [buttonLayer setBorderWidth:0.0];
    buttonLayer  = buttonSepia.layer;
    [buttonLayer setBorderWidth:3.0];
    
    [imageView removeFromSuperview];
    [imageView setImage:[self makeSepiaScale:imageLoad]];
    [self.view addSubview:imageView]; 
}

- (IBAction)clickGray
{
    NSLog(@"Gray");
    [buttonLayer setBorderWidth:0.0];
    buttonLayer  = buttonGray.layer;
    [buttonLayer setBorderWidth:3.0];
    
    [imageView removeFromSuperview];
    [imageView setImage:[self makeGraycale:imageLoad]];
    [self.view addSubview:imageView];
}

- (IBAction)clickNored
{
    NSLog(@"Nored");
    [buttonLayer setBorderWidth:0.0];
    buttonLayer  = buttonNored.layer;
    [buttonLayer setBorderWidth:3.0];
    
    [imageView removeFromSuperview];
    [imageView setImage:[self makeNored:imageLoad]];
    [self.view addSubview:imageView];
}

- (IBAction)clickQuartz
{
    NSLog(@"Quartz");
    [buttonLayer setBorderWidth:0.0];
    buttonLayer  = buttonQuartz.layer;
    [buttonLayer setBorderWidth:3.0];
    
    [imageView removeFromSuperview];
    [imageView setImage:[self makeQuartz:imageLoad]];
    [self.view addSubview:imageView];
}

- (IBAction)clickHue
{
    NSLog(@"Hue");
    [buttonLayer setBorderWidth:0.0];
    buttonLayer  = buttonHue.layer;
    [buttonLayer setBorderWidth:3.0];
    
    [imageView removeFromSuperview];
    [imageView setImage:[self makeHue:imageLoad]];
    [self.view addSubview:imageView];
}

//  Sepia Image : 
-(UIImage*)makeSepiaScale:(UIImage*)image
{
    CGImageRef cgImage = [image CGImage];
    CGDataProviderRef provider = CGImageGetDataProvider(cgImage);
    CFDataRef bitmapData = CGDataProviderCopyData(provider);
    UInt8* data = (UInt8*)CFDataGetBytePtr(bitmapData); 
    
    int width = image.size.width;
    int height = image.size.height;
    NSInteger myDataLength = width * height * 4;
    
    
    for (int i = 0; i < myDataLength; i+=4)
    {
        UInt8 r_pixel = data[i];
        UInt8 g_pixel = data[i+1];
        UInt8 b_pixel = data[i+2];
        
        int outputRed = (r_pixel * .393) + (g_pixel *.769) + (b_pixel * .189);
        int outputGreen = (r_pixel * .349) + (g_pixel *.686) + (b_pixel * .168);
        int outputBlue = (r_pixel * .272) + (g_pixel *.534) + (b_pixel * .131);
        
        if(outputRed>255)outputRed=255;
        if(outputGreen>255)outputGreen=255;
        if(outputBlue>255)outputBlue=255;
        
        
        data[i] = outputRed;
        data[i+1] = outputGreen;
        data[i+2] = outputBlue;
    }
    
    CGDataProviderRef provider2 = CGDataProviderCreateWithData(NULL, data, myDataLength, NULL);
    int bitsPerComponent = 8;
    int bitsPerPixel = 32;
    int bytesPerRow = 4 * width;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitmapInfo = kCGBitmapByteOrderDefault;
    CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
    CGImageRef imageRef = CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, colorSpaceRef, bitmapInfo, provider2, NULL, NO, renderingIntent);
    
    CGColorSpaceRelease(colorSpaceRef); // YOU CAN RELEASE THIS NOW
    CGDataProviderRelease(provider2); // YOU CAN RELEASE THIS NOW
    CFRelease(bitmapData);
    
    UIImage *sepiaImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef); // YOU CAN RELEASE THIS NOW
    return sepiaImage;
}

//GrayCale image :
- (UIImage*) makeGraycale:(UIImage*) image {
    int width = image.size.width; int height = image.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate (nil, width, height, 8, 0, colorSpace, kCGImageAlphaNone);
    CGColorSpaceRelease(colorSpace);                        
    if (context == NULL) { return nil; }                                      
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), image.CGImage);
    imageFilter = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    CGContextRelease(context);
    return imageFilter; 
}

//makeRed : image 
- (UIImage *)makeNored:(UIImage *)image
{
    // load image
    CGImageRef imageRef = image.CGImage;
    NSData *data        = (NSData *) CGDataProviderCopyData(CGImageGetDataProvider(imageRef));
    char *pixels        = (char *)[data bytes];
	
    // manipulate the individual pixels
    for(int i = 0; i < [data length]; i += 4)
    {
        int r = i;
        int g = i+1;
        int b = i+2;
        int a = i+3;
		
        pixels[r]   = 0;
        pixels[g]   = pixels[g];
        pixels[b]   = pixels[b];
        pixels[a]   = pixels[a];
    }
	
    // create a new image from the modified pixel data
    size_t width                    = CGImageGetWidth(imageRef);
    size_t height                   = CGImageGetHeight(imageRef);
    size_t bitsPerComponent         = CGImageGetBitsPerComponent(imageRef);
    size_t bitsPerPixel             = CGImageGetBitsPerPixel(imageRef);
    size_t bytesPerRow              = CGImageGetBytesPerRow(imageRef);
	
    CGColorSpaceRef colorspace      = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitmapInfo         = CGImageGetBitmapInfo(imageRef);
    CGDataProviderRef provider      = CGDataProviderCreateWithData(NULL, pixels, [data length], NULL);
	
    CGImageRef newImageRef = CGImageCreate (
											width,
											height,
											bitsPerComponent,
											bitsPerPixel,
											bytesPerRow,
											colorspace,
											bitmapInfo,
											provider,
											NULL,
											false,
											kCGRenderingIntentDefault
											);
    imageFilter   = [UIImage imageWithCGImage:newImageRef];
	return imageFilter;
}

//Quartz image :
- (UIImage *)makeQuartz:(UIImage *)image
{
    CGImageRef sourceImage = image.CGImage;
    
	CFDataRef theData;
	theData = CGDataProviderCopyData(CGImageGetDataProvider(sourceImage));
    
	UInt8 *pixelData = (UInt8 *) CFDataGetBytePtr(theData);
    
	int dataLength = CFDataGetLength(theData);
    
	int red = 0;
	int green = 1;
	int blue = 2;
    
	for (int index = 0; index < dataLength; index += 4) {
		if (pixelData[index + green] - 128 > 0) {
			pixelData[index + red] = pixelData[index + green] - 128;
			pixelData[index + blue] = pixelData[index + green] - 128;
		} else {
			pixelData[index + red] = 0;
			pixelData[index + blue] = 0;
		}
	}
    
	CGContextRef context;
	context = CGBitmapContextCreate(pixelData,
                                    CGImageGetWidth(sourceImage),
                                    CGImageGetHeight(sourceImage),
                                    8,
                                    CGImageGetBytesPerRow(sourceImage),
                                    CGImageGetColorSpace(sourceImage),
                                    kCGImageAlphaPremultipliedLast);
    
	CGImageRef newCGImage = CGBitmapContextCreateImage(context);
	imageFilter = [UIImage imageWithCGImage:newCGImage];
    
	CGContextRelease(context);
	CFRelease(theData);
	CGImageRelease(newCGImage);
    return imageFilter;
}

//Hue : image
- (UIImage *)makeHue:(UIImage *)image
{
    CGImageRef inImage = image.CGImage;         
    CGContextRef ctx;
    CFDataRef m_DataRef; 
    m_DataRef = CGDataProviderCopyData(CGImageGetDataProvider(inImage)); 
    UInt8 * m_PixelBuf = (UInt8 *) CFDataGetBytePtr(m_DataRef); 
    int length = CFDataGetLength(m_DataRef); 
    
    for (int index = 0; index < length; index += 4) 
    { 
        m_PixelBuf[index + 1] = 255 - m_PixelBuf[index + 1]; 
        m_PixelBuf[index + 2] = 255 - m_PixelBuf[index + 2]; 
        m_PixelBuf[index + 3] =    255 - m_PixelBuf[index + 3];     
    } 
    
    ctx = CGBitmapContextCreate(m_PixelBuf, 
                                CGImageGetWidth( inImage ), 
                                CGImageGetHeight( inImage ), 
                                8, 
                                CGImageGetBytesPerRow( inImage ), 
                                CGImageGetColorSpace( inImage ), 
                                kCGImageAlphaPremultipliedFirst ); 
    
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx); 
    imageFilter = [UIImage imageWithCGImage:imageRef];
    CGContextRelease(ctx); 
    return imageFilter;  
}

/*
- (UIImage *)makeBrightness:(UIImage *)image
{
    CGImageRef img = image.CGImage;
    CFDataRef dataref = CopyImagePixels(img);
    UInt8 *data=(UInt8 *)CFDataGetLength(dataref);
    int length= CFDataGetLength(dataref);
    for (int index; index < length; index+=4) {
        for(int i=0;i<3;i++){
			if(data[index+i]+100<0){
				data[index+i]=0;
			}else{
				if(data[index+i]+100>255){
					data[index+i]=255;
				}else{
					data[index+i]+=100;
				}
			}
        }
    }
    
    size_t width=CGImageGetWidth(img);
	size_t height=CGImageGetHeight(img);
	size_t bitsPerComponent=CGImageGetBitsPerComponent(img);
	size_t bitsPerPixel=CGImageGetBitsPerPixel(img);
	size_t bytesPerRow=CGImageGetBytesPerRow(img); 
	CGColorSpaceRef colorspace=CGImageGetColorSpace(img); 
	CGBitmapInfo bitmapInfo=CGImageGetBitmapInfo(img);
	CFDataRef newData=CFDataCreate(NULL,data,length);
	CGDataProviderRef provider=CGDataProviderCreateWithCFData(newData);
	CGImageRef newImg=CGImageCreate(width,height,bitsPerComponent,bitsPerPixel,bytesPerRow,colorspace,bitmapInfo,provider,NULL,true,kCGRenderingIntentDefault);
    [imageFilter imageWithCGImage:newImg];
    CGImageRelease(newImg);
	CGDataProviderRelease(provider);
    return imageFilter;
}
*/
 
@end
