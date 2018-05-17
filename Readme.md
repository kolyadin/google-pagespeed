# About

This docker image is good for integration in CI workflow to automate google pagespeed testing.  

It's using npmjs psi package:  
https://www.npmjs.com/package/psi

### How to use

```bash
$ docker run -it --rm kolyadin/google-pagespeed --help

Usage
$ psi <url>

Options
--key        Google API Key. By default the free tier is used
--strategy   Strategy to use when analyzing the page: mobile|desktop
--format     Output format: cli|json|tap
--locale     Locale results should be generated in
--threshold  Threshold score to pass the PageSpeed test
--optimized  Get the URL of optimized resources
--download   Download optimized resources
```

### Demo 1

```bash
$ docker run -it --rm kolyadin/google-pagespeed \
    --threshold 80 \
    --strategy desktop \
    --format cli \
    https://marvel.com/

--------------------------------------------------------

URL:       marvel.com
Strategy:  desktop
Speed:     31

CSS size                                   | 485 kB
HTML size                                  | 688 kB
Image size                                 | 3.89 MB
JavaScript size                            | 3.11 MB
CSS resources                              | 6
Hosts                                      | 46
JS resources                               | 48
Resources                                  | 156
Static resources                           | 83
Other size                                 | 16 kB
textResponseBytes                          | 211 kB
Total size of request bytes sent           | 33.4 kB

Enable GZIP compression                    | 0.4
Leverage browser caching                   | 31.67
Main resource server response time         | 1.14
Minify CSS                                 | 0.02
Minify HTML                                | 0.49
Minify JavaScript                          | 0.1
Minimize render blocking resources         | 14
Optimize images                            | 181.83

--------------------------------------------------------

Threshold of 80 not met with score of 31
```

### Demo 2

```bash
$ docker run -it --rm kolyadin/google-pagespeed \
    --threshold 80 \
    --strategy mobile \
    --format json \
    https://marvel.com/
    
{
  "overview": {
    "URL": "marvel.com",
    "Strategy": "mobile",
    "Speed": 27,
    "Usability": 99
  },
  "statistics": {
    "cssResponseBytes": "390 kB",
    "htmlResponseBytes": "692 kB",
    "imageResponseBytes": "3.06 MB",
    "javascriptResponseBytes": "3.1 MB",
    "numberCssResources": 5,
    "numberHosts": 47,
    "numberJsResources": 47,
    "numberResources": 154,
    "numberStaticResources": 81,
    "otherResponseBytes": "13.9 kB",
    "textResponseBytes": "211 kB",
    "totalRequestBytes": "30.5 kB"
  },
  "ruleResults": {
    "AvoidLandingPageRedirects": 0,
    "AvoidPlugins": 0,
    "ConfigureViewport": 0,
    "EnableGzipCompression": 0.4,
    "LeverageBrowserCaching": 46.76,
    "MainResourceServerResponseTime": 2.18,
    "MinifyCss": 0.02,
    "MinifyHTML": 0.49,
    "MinifyJavaScript": 0.1,
    "MinimizeRenderBlockingResources": 88,
    "OptimizeImages": 127.2,
    "PrioritizeVisibleContent": 8,
    "SizeContentToViewport": 0,
    "SizeTapTargetsAppropriately": 0.18,
    "UseLegibleFontSizes": 0
  }
}

Threshold of 80 not met with score of 27
```

