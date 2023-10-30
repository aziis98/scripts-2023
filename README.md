# Scripts 2023

Yet another scripts repo, now for 2023.

## Usage

```bash shell
$ ./setup # install scripts
$ ./setup --help # get help
$ ./setup --status # after first run lists script locations
```

## Syntax

A directive starts with the keyword `[Script]`, this can be placed for example inside a
line comment. Then must follow one of the following directives

- `[Script] @Link TARGET`
    
    Link a script file to a target destination. Creates missing folders.

- `[Script] @Copy TARGET`
    
    Copy a script file to a target destination, removing the copy declaration. Creates missing folders.

### Patterns

The following variables are expanded inside directives arguments.

| Pattern | Description                  |  
|:-------:|:-----------------------------|
| `~`     | Home folder                  |  
| `%f`    | Current script base name     |       
| `%r`    | Current script relative path |   
| `%p`    | Current script absolute path | 
