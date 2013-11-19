# Server syntax highlit code. Useful for embedding code in Keynote pressies
#
# See README.md for details

require 'sinatra/base'
require 'open3'

class CodeServer < Sinatra::Base

  HTML = DATA.read

  #START:GET
  get "*" do
    path = File.join(".", params[:splat].join("/"))
    file_name = read_file(path, params)
    output, status = Open3.capture2e("pygmentize -f html #{file_name}")
    HTML
    .sub(/!CODE!/, output)
    .sub(/!FILENAME!/, path)
  end
  #END:GET

  #START:read
  def read_file(path, parms)
    if params[:part]
      read_part(path, params[:part])
    else
      path
    end
  end
  #END:read

  def read_part(path, part)
    ip = File.open(path)
    Dir.mkdir("tmp") unless File.exist?("tmp")
    tmp_file = File.join("tmp", path)
    File.open(tmp_file, "w") do |op|
      state = :skipping
      while line = ip.gets
        case line
        when /START:\s*#{part}/
          state = :copying
        when /END:\s*#{part}/
          state = :skipping
        when /START:|END:/
          # ignore
        else
          op.puts line if state ==:copying
        end
      end
    end
    tmp_file
  end

  run! if app_file == $0

end
__END__
<html>
  <head>
    <style>
      .highlight .hll { background-color: #333333 }
      .highlight  { 
      
      background: #111111; 
      
      color: #ffffff ;
      
      padding: 0.2em 0.9em;
      margin-bottom: 0em;
      font: normal normal normal 115%/normal 'Monaco', 'Courier New', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', monospace !important;
      line-height: 1.1em;
      overflow: auto;
      font-size: 1.0em;
      border: 1px solid #CCC;
        
      -moz-border-radius:7px;
      -webkit-border-radius:7px;
      border-radius:7px;
      
      
      }
      
      p > code, p > a > code
      {
      border-radius: 4px;
      -webkit-border-radius: 4px;
      -moz-border-radius: 4px;
      color: #C5CBD0;
      /*color: white*/
      background-image: url(/images/opaque_20.png);
      font-family: Menlo, Consolas, "Courier New", Courier, "Liberation Mono", monospace;
      font-size: 1.1em;
      /*height: 0px;
      image-rendering: auto;
      left: auto;
      list-style-type: disc;*/
      padding-bottom: 2px;
      padding-left: 4px;
      padding-right: 4px;
      padding-top: 2px;
      text-decoration: none;
      text-indent: 0px;
      text-shadow: none;
      text-transform: none;
      top: auto;
      
      }
      
      
      p > a > code
      {
      color: #95be7d;
      }
      
      code, pre {
      font-family: "Consolas", "Courier New", "Courier", "FreeMono", monospace;
      font-size:0.95em;
      margin: 1em 0 1.5em 0;
      }
      
      .highlight span
      {
      font-family: "Consolas", "Courier New", "Courier", "FreeMono", monospace;
      font-size:1em;
      }
      
      .highlight .hll { background-color: #49483e }
      .highlight  { /*background: #272822;*/ color: #f8f8f2 }
      .highlight .c { color: #75715e } /* Comment */
      .highlight .err { color: #960050; background-color: #1e0010 } /* Error */
      .highlight .k { color: #66d9ef } /* Keyword */
      .highlight .l { color: #ae81ff } /* Literal */
      .highlight .n { color: #f8f8f2 } /* Name */
      .highlight .o { color: #f92672 } /* Operator */
      .highlight .p { color: #f8f8f2 } /* Punctuation */
      .highlight .cm { color: #75715e } /* Comment.Multiline */
      .highlight .cp { color: #75715e } /* Comment.Preproc */
      .highlight .c1 { color: #75715e } /* Comment.Single */
      .highlight .cs { color: #75715e } /* Comment.Special */
      .highlight .ge { font-style: italic } /* Generic.Emph */
      .highlight .gs { font-weight: bold } /* Generic.Strong */
      .highlight .kc { color: #66d9ef } /* Keyword.Constant */
      .highlight .kd { color: #66d9ef } /* Keyword.Declaration */
      .highlight .kn { color: #f92672 } /* Keyword.Namespace */
      .highlight .kp { color: #66d9ef } /* Keyword.Pseudo */
      .highlight .kr { color: #66d9ef } /* Keyword.Reserved */
      .highlight .kt { color: #66d9ef } /* Keyword.Type */
      .highlight .ld { color: #e6db74 } /* Literal.Date */
      .highlight .m { color: #ae81ff } /* Literal.Number */
      .highlight .s { color: #e6db74 } /* Literal.String */
      .highlight .na { color: #a6e22e } /* Name.Attribute */
      .highlight .nb { color: #f8f8f2 } /* Name.Builtin */
      .highlight .nc { color: #a6e22e } /* Name.Class */
      .highlight .no { color: #66d9ef } /* Name.Constant */
      .highlight .nd { color: #a6e22e } /* Name.Decorator */
      .highlight .ni { color: #f8f8f2 } /* Name.Entity */
      .highlight .ne { color: #a6e22e } /* Name.Exception */
      .highlight .nf { color: #a6e22e } /* Name.Function */
      .highlight .nl { color: #f8f8f2 } /* Name.Label */
      .highlight .nn { color: #f8f8f2 } /* Name.Namespace */
      .highlight .nx { color: #a6e22e } /* Name.Other */
      .highlight .py { color: #f8f8f2 } /* Name.Property */
      .highlight .nt { color: #f92672 } /* Name.Tag */
      .highlight .nv { color: #f8f8f2 } /* Name.Variable */
      .highlight .ow { color: #f92672 } /* Operator.Word */
      .highlight .w { color: #f8f8f2 } /* Text.Whitespace */
      .highlight .mf { color: #ae81ff } /* Literal.Number.Float */
      .highlight .mh { color: #ae81ff } /* Literal.Number.Hex */
      .highlight .mi { color: #ae81ff } /* Literal.Number.Integer */
      .highlight .mo { color: #ae81ff } /* Literal.Number.Oct */
      .highlight .sb { color: #e6db74 } /* Literal.String.Backtick */
      .highlight .sc { color: #e6db74 } /* Literal.String.Char */
      .highlight .sd { color: #e6db74 } /* Literal.String.Doc */
      .highlight .s2 { color: #e6db74 } /* Literal.String.Double */
      .highlight .se { color: #ae81ff } /* Literal.String.Escape */
      .highlight .sh { color: #e6db74 } /* Literal.String.Heredoc */
      .highlight .si { color: #e6db74 } /* Literal.String.Interpol */
      .highlight .sx { color: #e6db74 } /* Literal.String.Other */
      .highlight .sr { color: #e6db74 } /* Literal.String.Regex */
      .highlight .s1 { color: #e6db74 } /* Literal.String.Single */
      .highlight .ss { color: #e6db74 } /* Literal.String.Symbol */
      .highlight .bp { color: #f8f8f2 } /* Name.Builtin.Pseudo */
      .highlight .vc { color: #f8f8f2 } /* Name.Variable.Class */
      .highlight .vg { color: #f8f8f2 } /* Name.Variable.Global */
      .highlight .vi { color: #f8f8f2 } /* Name.Variable.Instance */
      .highlight .il { color: #ae81ff } /* Literal.Number.Integer.Long */

       nav.file-name {
         margin-top: 0;
         padding: 0;
         text-align: right;
         font-size: 70%;
         color: #8a8;
       }
      }
    </style>
  </head>
  <body>
    !CODE!
    <nav class="file-name">
      !FILENAME!
    </nav>
  </body>
</html>
