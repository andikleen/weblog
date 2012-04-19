package weblog;

our $ip;
our $ident;
our $user;
our $date;
our $req;
our $status;
our $bytes;
our $referer;
our $useragent;

sub parse_weblog () {
	($ip,$ident,$user,$date,$req,$status,$bytes,$referer,$useragent) = 
        /([0-9.]+) (\S+) (\S+) \[(.*?)\] "(.*?)" (\d+) (\S+) "(.*?)" "(.*?)"/;
}

sub clean_useragent () { 
	$useragent =~ s#Mozilla/\d\.\d \((compatible; ?)?(.+?)\)#$2#; 
}

1;
