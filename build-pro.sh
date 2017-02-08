#!/bin/bash
export JAVA9_HOME=/Library/Java/JavaVirtualMachines/jdk-9.jdk/Contents/Home
export java=$JAVA9_HOME/bin/java

export PRO_HOME=/Users/daniel/workspace/snowcamp/java9/pro

echo ""
echo "============================"
echo "= Building with pro        ="
echo "============================"
echo ""
$PRO_HOME/bin/pro
echo ""
echo "======================"
echo "= End of Build       ="
echo "======================"
echo ""

#$java --module-path target/test/artifact:target/main/artifact:deps  \
#      -m papaya/io.snowcamp.papaya.test.Run

#Diagnostic 1
$java --module-path target/test/artifact:target/main/artifact:deps  \
      -classpath deps/hamcrest-core-1.3.jar    \
      -m papaya/io.snowcamp.papaya.test.Run