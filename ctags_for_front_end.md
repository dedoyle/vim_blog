# tagbar && ctags

## Install Exuberant Ctags on Windows

1. download zip package from [Exuberant Ctags](http://ctags.sourceforge.net/)

2. Add the binary folder to your PATH. My situation is "C:\ctags58\ctags.exe"

3. Add config according to your own PATH:

```vimscript
    let g:tagbar_ctags_bin = 'C:\ctags58\ctags.exe'
    set tags=d:\tags
    map <C-F12> :!ctags -R -f d:\tags d:\path\to\my\project\<CR>
```

4. add ctags.cnf file in $HOME
```
    
--exclude=.git
--exclude=.svn
--exclude=.idea
--exclude=node_modules
--exclude=bower_components
--exclude=log
--exclude=tmp
--exclude=vendors
--exclude=*.txt
--exclude=*.json
--exclude=*.min.js
--exclude=*.md
--exclude=Gruntfile.js

--languages=-javascript

--langdef=html
--langmap=html:.htm.html.erb
--regex-html=/[ \t]+id[ \t]*=[ \t]*['"]([^'"]+)/\1/o,object/
--regex-html=/[ \t]+ng-controller[ \t]*=[ \t]*['"]([^'"]+)/\1/o,object/
--regex-html=/[ \t]+ng-click[ \t]*=[ \t]*['"]([^'"]+)/\1/o,object/
--regex-html=/[ \t]+ng-change[ \t]*=[ \t]*['"]([^'"]+)/\1/o,object/
--regex-html=/[ \t]+ng-show[ \t]*=[ \t]*['"]([^'"]+)/\1/o,object/
--regex-html=/[ \t]+ng-if[ \t]*=[ \t]*['"]([^'"]+)/\1/o,object/
--regex-html=/[ \t]+ng-blur[ \t]*=[ \t]*['"]([^'"]+)/\1/o,object/
--regex-html=/[ \t]+ng-focus[ \t]*=[ \t]*['"]([^'"]+)/\1/o,object/
--regex-html=/[ \t]+ng-disabled[ \t]*=[ \t]*['"]([^'"]+)/\1/o,object/
--regex-html=/[ \t]+ng-repeat[ \t]*=[ \t]*['"][^'"]+ in \([^'"]+\)['"]/\1/o,object/

--langdef=js
--langmap=js:.js
--regex-js=/\$scope\.([A-Za-z0-9._\$]+)[ \t]*[:=]/\1/,variable/
--regex-js=/\.controller *\( *'([A-Za-z0-9_$]+)' *,/\1/,function/
--regex-js=/\.filter *\( *'([A-Za-z0-9_$]+)' *,/\1/,function/
--regex-js=/\.factory *\( *'([A-Za-z0-9_$]+)' *,/\1/,function/
--regex-js=/\.service *\( *'([A-Za-z0-9_$]+)' *,/\1/,function/
--regex-js=/\.directive *\([ \t]*'([A-Za-z0-9_$]+)'[ \t]*,/\1/,function/
--regex-js=/(,|(;|^)[ \t]*(var|let|([A-Za-z_$][A-Za-z0-9_$.]+\.)*))[ \t]*([A-Za-z0-9_$]+)[ \t]*=[ \t]*\{/\5/,object/
--regex-js=/(,|(;|^)[ \t]*(var|let|([A-Za-z_$][A-Za-z0-9_$.]+\.)*))[ \t]*([A-Za-z0-9_$]+)[ \t]*=[ \t]*function[ \t]*\(/\5/,function/
--regex-js=/(,|(;|^)[ \t]*(var|let|([A-Za-z_$][A-Za-z0-9_$.]+\.)*))[ \t]*([A-Za-z0-9_$]+)[ \t]*=[ \t]*\[/\5/,array/
--regex-js=/(,|(;|^)[ \t]*(var|let|([A-Za-z_$][A-Za-z0-9_$.]+\.)*))[ \t]*([A-Za-z0-9_$]+)[ \t]*=[ \t]*[^"]'[^']*/\5/,string/
--regex-js=/(,|(;|^)[ \t]*(var|let|([A-Za-z_$][A-Za-z0-9_$.]+\.)*))[ \t]*([A-Za-z0-9_$]+)[ \t]*=[ \t]*(true|false)/\5/,boolean/
--regex-js=/(,|(;|^)[ \t]*(var|let|([A-Za-z_$][A-Za-z0-9_$.]+\.)*))[ \t]*([A-Za-z0-9_$]+)[ \t]*=[ \t]*[0-9]+/\5/,number/
--regex-js=/(,|(;|^)[ \t]*(var|let|([A-Za-z_$][A-Za-z0-9_$.]+\.)*))[ \t]*([A-Za-z0-9_$]+)[ \t]*=[ \t]*.+([,;=]|$)/\5/,variable/
--regex-js=/(,|(;|^)[ \t]*(var|let|([A-Za-z_$][A-Za-z0-9_$.]+\.)*))[ \t]*([A-Za-z0-9_$]+)[ \t]*[ \t]*([,;]|$)/\5/,variable/
--regex-js=/function[ \t]+([A-Za-z0-9_$]+)[ \t]*\([^)]*\)/\1/,function/
--regex-js=/(,|^)[ \t]*([A-Za-z_$][A-Za-z0-9_$]+)[ \t]*:[ \t]*\{/\2/,object/
--regex-js=/(,|^)[ \t]*([A-Za-z_$][A-Za-z0-9_$]+)[ \t]*:[ \t]*function[ \t]*\(/\2/,function/
--regex-js=/(,|^)[ \t]*([A-Za-z_$][A-Za-z0-9_$]+)[ \t]*:[ \t]*\[/\2/,array/
--regex-js=/(,|^)[ \t]*([A-Za-z_$][A-Za-z0-9_$]+)[ \t]*:[ \t]*[^"]'[^']*/\2/,string/
--regex-js=/(,|^)[ \t]*([A-Za-z_$][A-Za-z0-9_$]+)[ \t]*:[ \t]*(true|false)/\2/,boolean/
--regex-js=/(,|^)[ \t]*([A-Za-z_$][A-Za-z0-9_$]+)[ \t]*:[ \t]*[0-9]+/\2/,number/
--regex-js=/(,|^)[ \t]*([A-Za-z_$][A-Za-z0-9_$]+)[ \t]*:[ \t]*[^=]+([,;]|$)/\2/,variable/

--langdef=less
--langmap=less:.less
--regex-less=/^[ \t]*\.([A-Za-z0-9_-]+)/\1/c,class,classes/
--regex-less=/^[ \t]*#([A-Za-z0-9_-]+)/\1/i,id,ids/
--regex-less=/^[ \t]*(([A-Za-z0-9_-]+[ \t\n,]+)+)\{/\1/t,tag,tags/
--regex-less=/^[ \t]*@media\s+([A-Za-z0-9_-]+)/\1/m,media,medias/

```

5. Then generate tags file by running " ctags -R -f d:\tags d:\path\to\my\project\". And you can generate tags in vim by pressing ctrl and f12

6. open vim and toggle the tagbar, you will see it
