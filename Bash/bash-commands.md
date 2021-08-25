# Bash Commands

## TOC

TOC here

## Help

```bash
<command> --help
```
Get command help

---

```bash
man <command>
```
Get man page of command

type: `/<search term>` to search  
=> type: `n` go to next match  
=> type: `N` go to prev match  

## Basics

```bash
who
```
Show all logged in users

---

```bash
whoami
```
Show my username

---

```bash
ls -la
```
list all files and folders - also hidden (a)

---

```bash
chmod 777 file.txt
```
set permission for file.txt

![](files/permission_list.png)

---

```bash
sudo nautilus
```
gnu file manager as root

---

```bash
pwd
```
Get current directory

---

```bash
find / -name "*usb*.conf" 2>/dev/null
```
find from root any file matching  
suppress all stderr

---

```bash
cut -d ' ' -f 2,4 blumenartikel.txt
```
get column 2 & 4 (`-f`) from file using delimiter (space) (`-d`)

---

```bash
sort -n -k 2 tmp.out
```
Sort the 2nd col (`-k`) ASC using number (`-n`) from file tmp.out

---

```bash
ln -s /home/vmadmin/M122
ln -s /home/vmadmin/M122 /home/vmadmin/Desktop/M122_Alias # with target specified (M122_Alias)
```
Create symbolic link

---

```bash
ls -la | tee dir.txt # shows console output
ls -la >dir.txt # won't show console output
```
Show stdout in console and write to file

---

```bash
which ifconfig # out: /usr/sbin/ifconfig
```
Show path of executable

<!-- ---

```bash
```
command description -->

## Vars

```bash
HELLO="World"
echo $HELLO
```

- `$PATH` _Locations containing executables_
- `$?`  _Exit status of last command / script_

## Parameters

```bash
./script.sh hello world
```
- `$0` = `./script.sh` - script path
- `$@` = `hello world` - array of all arguments
- `$1` = `hello`
- `$2` = `world`
- ...
- `$#` = `2` - number of arguments

## Pipe |

![](files/pipe.png)

```bash
cat outputblumen.txt | more -1
```
Get content of file and pass to more to show only 1 line

## Pre exec $()

```bash
chmod 777 $(find /home/vmadmin/ -name *.txt)
```
Change permission for every file in /home/vmadmin with filetype `.txt`

## Write to file

```bash
<command> 2>/dev/null               # hide all stderr in console

# into file:
<command> >no_errors.txt            # stdout
<command> 2>errors.txt              # stderr
<command> &>out_and_errors.txt      # stdout & stderr

<command> >stdout.txt 2>stderr.txt  # stdout & stderr - separate file
```

## Read input

```bash
read USER_INPUT # limit number of chars using `-N <int: chars>`
echo $USER_INPUT
```

## if

```bash
if [ $1 -eq 'hello' ] # see Comparer below
then
    echo 'welt'
else
    echo 'hh'
fi
```

| Comparer                    | Explanation                                                           |
| --------------------------- | --------------------------------------------------------------------- |
| `! <EXPRESSION>`            | The EXPRESSION is false.                                              |
| `-n <STRING>`               | The length of STRING is greater than zero.                            |
| `-z <STRING>`               | The lengh of STRING is zero (ie it is empty).                         |
| `<STRING1> = <STRING2>`     | STRING1 is equal to STRING2                                           |
| `<STRING1> != <STRING2>`    | STRING1 is not equal to STRING2                                       |
| `<INTEGER1> -eq <INTEGER2>` | INTEGER1 is numerically equal to INTEGER2                             |
| `<INTEGER1> -gt <INTEGER2>` | INTEGER1 is numerically greater than INTEGER2                         |
| `<INTEGER1> -lt <INTEGER2>` | INTEGER1 is numerically less than INTEGER2                            |
| `-d <FILE>`                 | FILE exists and is a directory.                                       |
| `-e <FILE>`                 | FILE exists.                                                          |
| `-r <FILE>`                 | FILE exists and the read permission is granted.                       |
| `-s <FILE>`                 | FILE exists and it's size is greater than zero (ie. it is not empty). |
| `-w <FILE>`                 | FILE exists and the write permission is granted.                      |
| `-x <FILE>`                 | FILE exists and the execute permission is granted.                    |

## switch case

```bash
echo -n "Enter the name of a country: "
read COUNTRY

case $COUNTRY in
  "Switzerland") # string
    echo -n "Schweiz"
    ;;

  [0-9]) # using regex
    echo -n "any Number"
    ;;

  *)
    echo -n "unknown"
    ;;
esac
```

## for

```bash
for i in {0..3} # for item in [LIST]
do
  echo "Number: $i"
done

# declaring array:
BOOKS=('In Search of Lost Time' 'Don Quixote' 'Ulysses' 'The Great Gatsby')
for book in "${BOOKS[@]}"; do
  echo "Book: $book"
done

# using i:
for ((i = 0 ; i <= 1000 ; i++)); do
  echo "Counter: $i"
done

# using files:
for file in /home/vmadmin/Desktop/M122; do
    echo $file
done
```

## Regex

> Reference: `122 DossierL.pdf` - Page 59

```bash
grep '1$' mrolympia.dat
```

