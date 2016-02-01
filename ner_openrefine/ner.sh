#!/bin/sh
scriptdir=`dirname $0`

# http://stackoverflow.com/questions/15624667/mac-osx-java-terminal-version-incorrect
/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin/java -mx700m -cp "$scriptdir/stanford-ner.jar:" edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier $scriptdir/classifiers/english.all.3class.distsim.crf.ser.gz -textFile ${1:-/dev/fd/0}
