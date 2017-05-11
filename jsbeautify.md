# Install js-beautify

npm install -g js-beautify


# Usage

## js

```
    js-beautify foo.js
```

## css

```
    css-beautify foo.css
```

## html

```
    html-beautify foo.html
```


# In vim

```
    autocmd FileType javaScript noremap <buffer> <c-f> :%!js-beautify -j -q -B -f -<cr>
    autocmd FileType css noremap <buffer> <c-f> :%!css-beautify -I -q -f -<cr>
    autocmd FileType html noremap <buffer> <c-f> :%!html-beautify -L -N -q -f -<cr>
```
