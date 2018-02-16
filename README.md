# dict.cc.sh

A bash script that calls <http://pocket.dict.cc/> with lynx, cuts the output and
echoes it to the terminal. Depending on the number of available lines in the
current terminal view it calls less. By default dict.cc tries to translate
between german and english. The bash script takes the optional parameter
-\<from\>\<to\>  for calling specific languages; e.g.  "-enfr" for english - french.

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
   subsystem
          Teilsystem {n}
          Untersystem {n}
          Teilanlage {f}

   subsystem <SS>
          Subsystem {n} <SS>

   communications subsystem
          Kommunikationsuntersystem {n}

                                  0.000 sec
# en-fr example
~ $ dict -enfr problem
   problem
          problème {m}

   problem [hassle]
          tracas {m}

   No problem!
          Pas de problème !

   major problem
          grand problème {m}

   to get at / to the root of the problem
          aller au fond du problème

                                  0.002 sec
```

## Usage

Simply source dict.cc.sh inside your ~/.bashrc or ~/.bash\_profile. 

Command | Explanation
------------ | -------------
dict \<term\> | Calls dict.cc with the specified term. The term can consist of several words.
dict -\<from\>\<to\> \<term\> | Calls pocket.dict.cc with the specified languages.
