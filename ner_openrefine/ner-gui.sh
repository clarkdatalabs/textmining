#!/bin/sh
scriptdir=`dirname $0`

# http://stackoverflow.com/questions/15624667/mac-osx-java-terminal-version-incorrect
/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin/java -mx700m -cp "$scriptdir/stanford-ner.jar:" edu.stanford.nlp.ie.crf.NERGUI
