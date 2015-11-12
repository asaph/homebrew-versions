class Tomcat7 < Formula
  desc "Implementation of Java Servlet and JavaServer Pages"
  homepage "https://tomcat.apache.org/"
  url "https://www.apache.org/dyn/closer.cgi?path=tomcat/tomcat-7/v7.0.65/bin/apache-tomcat-7.0.65.tar.gz"
  sha256 "ef0edb1f560702adc4096097ddfba038086d62da77d0b247d927fd326bc637e9"

  bottle do
    cellar :any
    sha256 "9de99ef0c276d781b7f0221c4869af47f5cddf7cbb234a1496254149810a6bc1" => :yosemite
    sha256 "9afff974b90c8c52beaf6b6f91b529fb0b241c6af64b31c358db4a4ad204999a" => :mavericks
    sha256 "24ef38275d081c6b405ee2b45cf6e56ef7910402e9a1464a5e614de2127be066" => :mountain_lion
  end

  conflicts_with "tomcat", :because => "Differing versions of same formula"

  option "with-fulldocs", "Install full documentation locally"

  resource "fulldocs" do
    url "https://www.apache.org/dyn/closer.cgi?path=/tomcat/tomcat-7/v7.0.65/bin/apache-tomcat-7.0.65-fulldocs.tar.gz"
    version "7.0.65"
    sha256 "a6c3f6d63d4057cf23bf98d2c339ba1e48ceb67ea42a9d8bd097a0a502cdedfa"
  end

  # Keep log folders
  skip_clean "libexec"

  def install
    # Remove Windows scripts
    rm_rf Dir["bin/*.bat"]

    # Install files
    prefix.install %w[NOTICE LICENSE RELEASE-NOTES RUNNING.txt]
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/catalina.sh" => "catalina"

    (share/"fulldocs").install resource("fulldocs") if build.with? "fulldocs"
  end
end
