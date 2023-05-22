# shell-tasks-log-decorator

This is a simple bash script that will help you keep track of multiple
background shell processes output in the same place.

Features:
- each line of a script in a subshell will be "decorated" with a distinct
  color and prefixed with an arbitrary task name (defined by you). This
  allows you to grep the lines for a given task, for example
- optionally, you can add a timestamp, whichi will be automatically
  generate for you to easily keep track of the time
- when the "task" finishes, it will show the elapsed time
- if the task fails, it will print a very clear message, so it is easy to
  find it in the logs
- no need for big changes, just use a subshell and declare the task name

## Usage

```sh

source task-decorator.sh

(
  task "one job"

  # write whatever you want here
)&

(
  task "another job" with_timestamps

  # more stuff here
)&
```

## Example

```sh

#!/usr/bin/env bash

source task-decorator.sh

(
    task "important stuff"
    echo "some stuff"
    echo "more stuff"
    sleep 2
) &    

(
    task "parallel stuff" with_timestamp
    echo "this runs in parallel"
    sleep 1
    echo "more parallel stuf"
) &    

wait
```

Output:

![](example.png)

