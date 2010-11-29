/*
-(void)deviceTokenReceived:(NSNotification*)notification
{
	int c = [messageContainer GetUnreadCount] ;
	if(c>0)
	{
		MessagesLabel.text= [NSString stringWithFormat:@"%i",c]; 
		MessagesButton.imageView.image = [UIImage imageNamed:@"mail_new.png"];
	}
	else
	{
		MessagesLabel.text=@"";
		MessagesButton.imageView.image = [UIImage imageNamed:@"mail.png"];
		
	}
	
	
	if(requestPending)
	{
		return;
	}
	else 
	{
		
		
		NSString* deviceToken = [[NSUserDefaults standardUserDefaults] stringForKey:@"deviceToken"];
		
		if(deviceToken)
		{
			devicePresent = YES;
			NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:  @"http://intothesurf.com/lavaman/device/getmessagecount?deviceToken=%@", deviceToken]]];
			
			msgCountData = [[NSMutableData alloc]init];
			requestPending= YES;
			[NSURLConnection connectionWithRequest:req delegate:self];
		}
		else
		{
			int lastId=0;
			devicePresent=NO;
			
			lastId = [messageContainer GetLastMessageId];
			
			
			
			NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:  @"http://intothesurf.com/lavaman/device/getmessagetodownload?lastId=%i", lastId]]];
			
			msgCountData = [[NSMutableData alloc]init];
			requestPending= YES;
			[NSURLConnection connectionWithRequest:req delegate:self];
			
		}
		
	}
	
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[msgCountData appendData:data];
}

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	requestPending = NO;
	
	NSLog( @"%@",[error localizedDescription  ]);
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
	requestPending = NO;
	NSString *count = [[NSString alloc] initWithData:msgCountData encoding:NSASCIIStringEncoding];
	if(count)
	{
		NSLog(count);
		int i = [count intValue];
		messageContainer.NotDownloaded =i;
		if(i>0)
		{
			
			int c = [messageContainer GetUnreadCount] + i;
			
			
			MessagesLabel.text= [NSString stringWithFormat:@"%i",c]; 
			MessagesButton.imageView.image = [UIImage imageNamed:@"mail_new.png"];
		}
		else 
		{
			
		}
		
	}
	[count release];
	
}

*/