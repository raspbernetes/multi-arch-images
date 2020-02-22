#!/bin/bash
set -euo pipefail

CMD=bazel

# Download Bazel compilation dependencies
apt install -y default-jre default-jdk openjdk-8-jdk --fix-missing

# JAVA_HOME will be set to default-java for all intents and purposes rather than explicit version
export JAVA_HOME=/usr/lib/jvm/default-java/

# The Bazel compile script will present OOM if running on a device with limited resources, these 
# values will set reasonable constraints to avoid this issue
export JAVA_OPTS="-Xms128M -Xmx512M"
export _JAVA_OPTIONS="-Xms128M -Xmx512M"
export JAVA_TOOL_OPTIONS="-Xmx512M"
export BAZEL_JAVAC_OPTS="-J-Xms128M -J-Xmx512M"

export PATH=$JAVA_HOME/bin:$PATH

# Download Bazel dist & unpackage
wget https://github.com/bazelbuild/bazel/releases/download/0.29.1/bazel-0.29.1-dist.zip
unzip -d bazel bazel-0.29.1-dist.zip && cd bazel

# Limit maximum size of the Java heap to 500 MB - Raspberry Pi 4b requirement 
# Note: The above environment variables should solve this however, setting just to be safe
sed -i 's/\"@\${paramfile}\"/& -J-Xmx512M/' scripts/bootstrap/compile.sh

# JAVA_HOME is referencing openJDK1.8 for version compatibility
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-armhf ./compile.sh
mv output/bazel /usr/local/bin/bazel
[[ "$CMD" -eq 0 ]] && echo "Failed to execute bazel"