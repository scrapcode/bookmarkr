# Bookmarkr
By: [Cam Cecil](http://github.com/scrapcode)

Open Source cloud bookmarking.

### Installation

1. git clone http://github.com/scrapcode/bookmarkr.git
2. bundle install
3. rake db:migrate

### Button Code
Thanks, [Google](http://google.com).

```
javascript:(function(){var%20a=window,b=document,c=encodeURIComponent,d=a.open("http://localhost:3000/marks/new/"+c(b.title)+"/"+c(b.location),"bkmk_popup","left="+((a.screenX||a.screenLeft)+10)+",top="+((a.screenY||a.screenTop)+10)+",height=510px,width=550px,resizable=1,alwaysRaised=1");a.setTimeout(function(){d.focus()},300)})();
```

### Change Log
_V0.0.1_
* Complete recode from previous project [Zipmark](http://github.com/scrapcode/zipmark)
* Using rails 4.1.0 instead of 3.*
* Create own relationships model instead of relying on [acts_as_taggable_on](https://github.com/mbleigh/acts-as-taggable-on)
* Upgrade to Bootstrap3 during development