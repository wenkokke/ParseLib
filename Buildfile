# dependencies: frege compiler
FregeC_VERSION  = '3.21.107-g4bd09eb'
FregeC_URL      = "http://frege.googlecode.com/files/frege#{FregeC_VERSION}.jar"
FregeC          = download(artifact("frege:frege:jar:#{FregeC_VERSION}")=>FregeC_URL)

# top-level project:
project 'ParseLib' do
  extend Frege
  
  project.version = '1.0.0'
  
  compile.using(
    :source => '1.7',
    :target => '1.7',
    :other  => %w{-encoding utf-8})
  
  compile.with FregeC
  compile.from _(:target,:java)
  
  # file task to generate java sources
  file _(:target,:java) => [
    frc('parselib.Simple'),
    frc('parselib.Standard'),
    frc('parselib.examples.Arith')]
    
  # compile parselib.examples to java
  file frc('parselib.examples.Arith') => [
        fr('parselib.examples.Arith'),
        frc('parselib.Simple')] do
    fregec('parselib.examples.Arith')
  end
  
  # compile parselib.standard to java
  file frc('parselib.Standard') => [
        fr('parselib.Standard'),
        frc('parselib.standard.Applications'),
        frc('parselib.standard.Derived'),
        frc('parselib.standard.Core')] do
    fregec('parselib.Standard')
  end
  file frc('parselib.standard.Applications') => [
        fr('parselib.standard.Applications'),
        frc('parselib.standard.Derived'),
        frc('parselib.standard.Core')] do
    fregec('parselib.standard.Applications')
  end
  file frc('parselib.standard.Derived') => [
        fr('parselib.standard.Derived'),
        frc('parselib.standard.Core')] do
    fregec('parselib.standard.Derived')
  end
  file frc('parselib.standard.Core') => [
        fr('parselib.standard.Core'),
        frc('parselib.simple.Core'),
        frc('frege.control.Alternative')] do
    fregec('parselib.standard.Core')
  end
  
  # compile control.alternative to java
  file frc('frege.control.Alternative') => [
        fr('frege.control.Alternative')] do
    fregec('frege.control.Alternative')
  end
  
  # compile parselib.simple to java
  file frc('parselib.Simple') => [
        fr('parselib.Simple'),
        frc('parselib.simple.Applications'),
        frc('parselib.simple.Derived'),
        frc('parselib.simple.Core')] do
    fregec('parselib.Simple')
  end
  file frc('parselib.simple.Applications') => [
        fr('parselib.simple.Applications'),
        frc('parselib.simple.Derived'),
        frc('parselib.simple.Core')] do
    fregec('parselib.simple.Applications')
  end
  file frc('parselib.simple.Derived') => [
        fr('parselib.simple.Derived'),
        frc('parselib.simple.Core')] do
    fregec('parselib.simple.Derived')
  end
  file frc('parselib.simple.Core') => [
        fr('parselib.simple.Core')] do
    fregec('parselib.simple.Core')
  end
  
end

# utility: Frege Compiler
module Frege
  def fr(mod)
    _(:src,:fr,mod.gsub(/\./,File::SEPARATOR).ext('.fr'))
  end
  def frc(mod)
    _(:target,:java,mod.gsub(/\./,File::SEPARATOR).ext('.java'))
  end
  def fregec(mod)
  
    # alias some paths
    fregec  = repositories.locate FregeC
    target  = _(:target,:java)
    srcpath = "#{_(:src,:java)};#{_(:target,:java)}"
    
    # run frege compiler
    mkdir_p target
    puts compile = "java -Xss1m -jar #{fregec} -d #{target} -fp #{srcpath} #{fr(mod)}"
    fail unless system compile
  end
end