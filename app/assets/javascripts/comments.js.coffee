# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


###
delete from patterns
USING patterns, patterns as vtable
WHERE (patterns.ID > vtable.ID)
AND (table1.sysname=vtable.sysname)
AND (table1.mode=vtable.mode)
AND (table1.var=vtable.var)
AND (table1.sysname=vtable.sysname)
AND (table1.val=vtable.val)

ALTER IGNORE TABLE tmp ADD UNIQUE INDEX(a,b);

ALTER IGNORE TABLE tmp ADD UNIQUE INDEX('sysname', 'var', 'mode', 'val');




Swap:   524284k total,   197820k used,   326464k free,   218716k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
 2161 mysql     20   0  698m  16m 2152 S  100  3.9   4026:21 mysqld
 2614 root      20   0  144m 2600 1092 S    0  0.6   7:19.80 fail2ban-server
 ###
