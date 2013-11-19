This is a quick hack to allow syntax-highlighted segments of code to
be automatically embedded in a Keynote presentation.

It relies on the now-deprecated Webview link. (But see later for the
good news).

This code is a Sinatra server. Run it from a directory containing the
code you want to embed.

Then, in the Keynote, add a web view, and set the URL to 

    http://localhost:4567/path/to_file.ex

The server runs `pygmentize` on the file, and returns the result as
HTML, which is displayed in the slide.

If you only want to include portions of a file, add `&part=xxx` on the
URL, and in the source file denote that corresponding section(s) with
comments containing `START:xxx` and `END:xxx`.

### But Keynote no longer lets me create webview links

True, but... you can take a webview object from Keynote 8 and copy it
into Keynote 9. You can then use the inspector to change the
URL. The good folks at

     https://engineering.purdue.edu/ECN/Support/KB/Docs/KeynoteWebview

have provided a handy downloadable single page presenation
containing just such an object.

### Prerequisites

 * pygmentize
 * sinatra-base

### Copyright and License

Copyright (c) 2013 Dave Thomas, @pragdave, <dave@pragprog.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

