# dict.cc.sh

A bash script that calls <http://pocket.dict.cc/> with lynx, cuts the output and
echoes it to the terminal. Depending on the number of lines it calls less. By 
default dict.cc tries to translate between german and english. The bash script
takes the optional parameter -<from><to>  for calling specific languages; e.g. 
"-enfr" for english - french.

## Dependencies

- lynx
- tr
- sed
- tail
- wc

## Example

```bash
# Default is en-de and de-en
~ $ dict subsystem
                    5 results for en-de      » [2]de-en

   [3]subsystem
          [4]Teilsystem {n}
          [5]Untersystem {n}
          [6]Teilanlage {f}

   [7]subsystem <SS>
          [8]Subsystem {n} <SS>

   [9]communications subsystem
          [10]Kommunikationsuntersystem {n}

                                  0.000 sec

# en-fr example
~ $ dict -enfr problem
                    5 results for en-fr      » [2]fr-en

   [3]problem
          [4]problème {m}

   [5]problem [hassle]
          [6]tracas {m}

   [7]No problem!
          [8]Pas de problème !

   [9]major problem
          [10]grand problème {m}

   [11]to get at / to the root of the problem
          [12]aller au fond du problème

                                  0.002 sec
```

## Usage

LESS\_CONDITION can be set inside the bash script, it configures the number of 
lines until less is called. Simply source dict.cc.sh inside your ~/.bashrc 
or ~/.bash\_profile. 

Command | Explanation
------------ | -------------
dict \<term\> | Calls dict.cc with the specified term. The term can consist of several words.
dict -\<from\>\<to\> \<term\> | Calls pocket.dict.cc with the specified languages.


