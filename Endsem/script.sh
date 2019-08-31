#!/bin/bash
depth=4
breadth=3
node_id=0 #for testing, increments +1 each time a folder is created.

# args: level( [0,depth) ), childNo ( [0,breadth) )
generateTreeDFS(){
declare -i level=$1
declare -i childNo=$2
declare -i i=0
    if (( $level < $depth ));then
        mkdir "n_$childNo-$node_id"
        cd "n_$childNo-$node_id"
        let node_id++
        let level++

        while [ $i -lt $breadth ]
        do
            generateTreeDFS $level $i
            let i++
        done
        cd ..
    fi
}

generateTreeDFS 0 0
