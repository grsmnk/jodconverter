#!/bin/bash

cd jodconverter-core

sed -i "s:<groupId>org.artofsolving.jodconverter</groupId>$:<groupId>kirasystems</groupId>:g" pom.xml
mvn package -Dmaven.test.skip=true

VERSION=$(ls target | sed -n 's/jodconverter-core-\(.*\).jar/\1/p')
lein deploy releases kirasystems/jodconverter-core $VERSION target/jodconverter-core-$VERSION.jar pom.xml;
