Why?
===

I really like listening to interviews while driving :p
I don't care about the video...

How
===

0. `git clone $this`, `bundle install`
1. Set up Youtube-mp3 from: https://github.com/salgadobreno/youtube-mp3
2. Set your Redis to persist otherwise you'll lose the queue when you
   restart, on redis.conf:

    save 300 1 # save every 5 minutes if there's any change
    dbfilename dump.rdb
    dir /some_directory/

3. There's a sinatra app but it would only be worth it if you set it to
   start automatically, I just use the podbox script to add queues:

    ruby podbox {youtube_url}

4. The good thing(IMO) of having Redis set this way is that I can just
   queue stuff in a 'save for later' fashion, then anytime you feel like
getting that new stuff on your car's pen drive, run `QUEUE=* rake
resque:work` and it takes care of the rest for you. 

The MP3 Files will be downloaded into this script's root dir.
