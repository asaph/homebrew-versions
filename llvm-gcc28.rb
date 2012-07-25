require 'formula'

class LlvmGcc28 < Formula
  homepage 'http://llvm.org/docs/CommandGuide/html/llvmgcc.html'
  url 'http://llvm.org/releases/2.8/llvm-gcc-4.2-2.8-x86_64-apple-darwin10.tar.gz'
  version '2.8'
  md5 'b1ceb9d3a6cc36f6e274a9cdd773d72b'

  skip_clean :all # This is a binary install
  keg_only :provided_by_osx

  def install
    prefix.install Dir['*']
  end
end