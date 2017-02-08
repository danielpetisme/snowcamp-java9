#!/bin/bash
export JAVA8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_92.jdk/Contents/Home
export JAVA9_HOME=/Library/Java/JavaVirtualMachines/jdk-9.jdk/Contents/Home
export java=$JAVA9_HOME/bin/java
export javac=$JAVA8_HOME/bin/javac

# Compile
#   change this in part 2
mkdir -p target && rm -rf target/*
cp -r src/main/resources/* target/

echo ""
echo "============================"
echo "= Compiling src/main/java/ ="
echo "============================"
echo ""
$javac -classpath deps/json-20160810.jar:deps/vertx-core-3.3.3.jar:deps/vertx-web-3.3.3.jar \
       -XDignore.symbol.file \
       -d target/ \
       $(find src/main/java/ -name "*.java")
echo ""
echo "============================"
echo "= Compiling src/test/java/ ="
echo "============================"
echo ""
$javac -classpath target:deps/json-20160810.jar:deps/junit-4.12.jar \
       -d target/ \
       $(find src/test/java/ -name "*.java")
echo ""
echo "======================"
echo "= End of compilation ="
echo "======================"
echo ""

# Run
#   change this in part 1
#$java -classpath target:deps/vertx-core-3.3.3.jar:deps/vertx-web-3.3.3.jar:deps/vertx-internal-3.3.3.jar \
#      io.snowcamp.papaya.web.ExampleApp

# Diagnostic 1
#$java  --add-modules java.xml.bind -classpath target:deps/vertx-core-3.3.3.jar:deps/vertx-web-3.3.3.jar:deps/vertx-internal-3.3.3.jar \
#      io.snowcamp.papaya.web.ExampleApp

# Diagnostic 2
#$java  -Dsun.reflect.debugModuleAccessChecks=true --add-modules java.xml.bind -classpath target:deps/vertx-core-3.3.3.jar:deps/vertx-web-3.3.3.jar:deps/vertx-internal-3.3.3.jar \
#      io.snowcamp.papaya.web.ExampleApp

# Diagnostic 3
#$java --add-modules java.xml.bind \
#       --add-opens java.base/java.nio=ALL-UNNAMED \
#       -classpath target:deps/vertx-core-3.3.3.jar:deps/vertx-web-3.3.3.jar:deps/vertx-internal-3.3.3.jar \
#      io.snowcamp.papaya.web.ExampleApp

# Diagnostic 4
#$java --add-modules java.xml.bind \
#      --add-opens java.base/java.nio=ALL-UNNAMED \
#      --add-opens java.base/sun.nio.ch=ALL-UNNAMED \
#      -classpath target:deps/vertx-core-3.3.3.jar:deps/vertx-web-3.3.3.jar:deps/vertx-internal-3.3.3.jar \
#      io.snowcamp.papaya.web.ExampleApp


# Diagnostic 5
#$java --add-modules java.xml.bind \
#      --add-opens java.base/java.nio=ALL-UNNAMED \
#      --add-opens java.base/sun.nio.ch=ALL-UNNAMED \
#      --add-exports java.base/sun.net.dns=ALL-UNNAMED \
#      -classpath target:deps/vertx-core-3.3.3.jar:deps/vertx-web-3.3.3.jar:deps/vertx-internal-3.3.3.jar \
#      io.snowcamp.papaya.web.ExampleApp


$java -classpath target:deps/json-20160810.jar:deps/junit-4.12.jar:deps/hamcrest-core-1.3.jar \
      org.junit.runner.JUnitCore io.snowcamp.papaya.test.TestSuite
