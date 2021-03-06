![weblog] (http://halobates.de/weblog)

Simple web log analysis tools

Originally written long ago.

Written for apache, but should work with all web servers generating 
standard logs. This is a light weight alternative to more complex
database based setups. The output is simple ASCII that 
can be easily processed further in shell pipelines. They can be also
combined for more complex tasks.

One big advantage is simplicity, so can be easily adapted for specific
purposes.

It uses multiple passes through the logs and will likely not scale
to large logs. However it works quite well for moderate sized logs.

searchterms may need occasional updates for the latest URLs generated
by search engines

To use add the directory to your $PATH
export PATH=dir/webtools
or call weball with an absolute name to let it set the path.

If you don't know how to use it just run weball <log>

Dependencies: Perl-TimeDate
(yum install Perl-TimeDate or similar)

Tools:

## weball log
run all analyses on a log

somewhat slow for larger logs, because it does many passes
    N=NUM weball log 
print NUM top entries

## searchterms log 
extract search engine search terms from a http log
referer logging needs to be enabled
options:
    -n list numeric ips in front
    -c add search engine domain name
    -u print target
    -U print URLs typed into search engine
    -p print position in search engine results (or 0)

## referer log
print referer from a httpd access log 

## removecrawl log
remove search machine crawls from a http logfile

## robots log
display search engines

## tophits log
print hits for pages

## trails log
Identify individual visitors

## useragents log
print user agents from a log

## webbytes log
print total bytes transferred

## accumulate [fieldnum]
accumulate on fieldnum field
default field 1

For example to track countries of search engine
    searchterms -c log | accumulate

## weberrors log
print errors from a weblog

To get top errors 
    weberrors log | accumulate 2  | head

## webresolveip log
resolve hosts in a weblog

## webtimerange
print time range in a log

Andi Kleen
