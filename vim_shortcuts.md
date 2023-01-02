# Vim Shortcuts

## 1 Mode

### 1.1 normal -> insert

  ```
  i - insert
  a - append
  o - open a new line
  s - delete the character
  I - insert at the beginning of the line
  A - insert at the end of the line
  O - open a new line above
  S - delete the line
  ```

### 1.2 normal -> replace

  ```
  R
  ```

### 1.3 normal -> visual

  ```
  v
  ```

### 1.4 history

  ```
  q: - history command
  q? - history search with ?
  q/ - history search with /
  ```

## 2 navigation

  ```
  H - to the top of the screen
  M - to the middle of the screen
  L - to the bottom of the screen
  <c-f> - scroll a screen
  <c-b> - scroll up a screen
  <c-d> - scroll half screen
  <c-u> - scroll up half screen
  :linenumber / linenumber G - to the selected line
  fx - jump to next x in current line
  Fx - jump to previous x in current line
  ; - repeat f or F command
  , - repeat F or f command (reversed)
  } - jump to next paragraph
  { - jump to previous paragraph
  ```

## 3 Marks
  
  ```
  m{a-z} - mark current position
  M{a-z} - mark current position globally. (Marks take effect after exiting vim)
  `{a-z} - move to selected mark
  `` - move to last modified position
  :Marks - show all marks
  :delmarks a b - delete mark a and b
  :delmarks! - delete all marks
  ```

## 4 motions

  ```
  w - until the start of the next word.
  b - until the start of the previous word.
  e - to the end of the current word.
  ^ - to the beginning of the line.
  $ - to the end of the line.
  0 - to the start of the line.
  G - to the bottom of the file.
  gg - to the start of the file.
  ```

## 5 operators

  ```
  d - delete operator.
  dd - delete current line
  x - delete current character.
  u - undo
  <c-r> - redo
  r - replace
  c - change
  p - put previously deleted text
  y - copy
  yy - copy current line
  J - merge current line and next line.
  ------
  aw - a word
  as - a sentence
  ap - a paragraph
  ab - a block
  ```

## 6 register

  ```
  "ayy - put current line to register a 
  "Ayy - add current line to register a (upppercase A used to track register a)
  :reg - show all registers
  "+yy - put current line to system clipboard 
  "+p - put system clipboard to current cursor
  ```

## 7 search

  ```
  / - forward search
  ? - backward search
  * - search current word
  % - matching parentheses search
  n - next item
  N - previous item
  ------
  :vimgrep/pattern/g files - search all matched text, use :cw command to open search result
  :vimgrep/^##/g % - search in whole file where the text matches the pattern
  ```

## 8 substitute

  ```
  :s/old/new - only subsititute the first occurrence of the 'old' in the line
  :s/old/new/g - substitute globally in the line
  :#,#s/old/new/g - #,# are the line numbers of the range of the line
  :%s/old/new/g - substitute in the whole file
  :%s/old/new/g - with a prompt whether to substitute or not
  :.,+2s/old/new/g - current line and next two line
  ------
  :[range]g/pattern/command - search and execute command
  :%g/^xyz/nomarl dd - delete the line which starts with xyz
  ```

## 9 execute an external command

  ```
  :!
  ```

## 10 write to file

  ```
  write the buffer - :w filename
  selecting text to write -  visual mode to select text, and then :w filename
  ```

## 11 retrieving and merging files

  ```
  merge file - :r filename
  retrieve - :r !ls
  ```

## 12 format

  ```
  << - indent to the left
  >> - indent to the right
  ```

## 13 window

  ```
  <c-w>h/j/k/l - go to other window
  sp / vsp - create a split view
  ```

## 14 quickfix

  ```
  :cw - open a quickfix window
  :cl - list all items
  :cn - next item
  :cp - previous item
  :cr - first item
  ```

## 15 tab

  ```
  gt/gT - go to next tab
  tabnew - create a new tab
  ```

## 16 fold

  ```
  zf - create a fold in visual mode
  za - close/open current fold
  ```

## 17 Plugins

### 17.1 coc

  ```
  next-item - <TAB>
  confirm - <c-y>
  jump to the definition - gd
  go back - <c-o>
  ```

## 17.2 fzf

  ```
  <leader>b - open buffer list
  <leader>f - open file list
  :Maps - nomarl mode mappings
  :Windows - windows
  :Marks - marks
  ```

## 17.3 terminal

  ```
  <leader>t - open a terminal
  <leader><ESC> - exit terminal insert mode
  ```
