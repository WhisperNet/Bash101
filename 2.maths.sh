#!/bin/bash

expr 30 + 10 # expr -> evaluate an expression 
expr 10 - 5
expr 10/5

var1=50
var2=10
expr $var1 \* $var2 # as * is cpnsidered as  wildcard in bash we need to escape it to use 
