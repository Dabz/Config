<!--
  build.tpl for build.tpl

  made by @USER-NAME@
  login   @LOGIN-STRING@   <@USER-MAIL@>

  started on  @DATE-STAMP@ @USER-NAME@
  last update Mon 11 Apr 2011 03:47:17 PM CEST Gasparina Damien
-->


<project name="@PROJECT@" basedir="." default="full">

  <!--							-->
  <!-- 			PROPERTY 			-->
  <!--							-->

  <property name="src.dir" value="src" />
  <property name="build.dir" value="build" />
  <property name="classes.dir" value="${build.dir}/classes" />
  <property name="jars.dir" value="${build.dir}/jars" />
  <property name="main-class" value="@PROJECT@.Main" />
  <property name="project.name" value="@PROJECT@" />
  <property name="rootdir" value="${project.name}" />
  <property name="rootdirr" value="${rootdir}/${rootdir}" />
  <property name="tarball.name" value="${rootdir}.tar.bz2" />
  <property name="test.dir" value="Test" />

  <!--							-->
  <!-- 			TARGET 				-->
  <!--							-->


  <!--		Clean					-->
  <target name="clean">
    <delete dir="${build.dir}" failonerror="false" />
  </target>


  <!--		Compile					-->
  <target name="clean">
  <target name="compile">
    <mkdir dir="${classes.dir}" />
    <javac srcdir="${src.dir}" destdir="${classes.dir}" />
  </target>


  <!--		Jar					-->
  <target name="jar" depends="compile">
    <mkdir dir="${jars.dir}" />
    <jar destfile="${jars.dir}/${ant.project.name}.jar"
      basedir="${classes.dir}">
      <manifest>
	<attribute name="Main-Class" value="${main-class}" />
      </manifest>
    </jar>
  </target>


  <!--		Run					-->
  <target name="run" depends="jar">
    <java jar="${jars.dir}/${ant.project.name}.jar" fork="true" />
  </target>


  <!--		Test Suite				-->
  <target name="check" depends="compile">
    <junit printsummary="yes" haltonfailure="no">
      <classpath refid="custom.classPath" />
      <formatter type="brief" usefile="false" />
      <batchtest fork="yes" todir="${src.dir}">
	<fileset dir="${classes.dir}">
	  <include name="**/*Test.class" />
	</fileset>
      </batchtest>
    </junit>
  </target>

  <!--		Dist Check				-->
  <target name="distcheck" depends="dist">
    <mkdir dir="${test.dir}"/>
    <untar src="${tarball.name}" dest="${test.dir}" compression="bzip2"/>
    <ant dir="${test.dir}/${dist.dir}" target="check"/>
    <delete dir="${test.dir}" failonerror="false"/>
  </target>


  <!--		Documentation				-->
  <target name="doc">
    <javadoc sourcepath="${src.dir}" destdir="${doc.dir}"/>
  </target>


  <!--		Default rule				-->
  <target name="full" depends="clean, jar" />



  <!--		Initialize				-->
  <target name="initialize">
    <mkdir dir="${src.dir}" />

    <echo file="README">
      @PROJECT@
    </echo>

    <echo file="AUTHORS">
      @LOGIN@
    </echo>

    <echo file="TODO">
      @PROJECT@
    </echo>
  </target>


  <!--		Dist					-->
  <target name="dist" depends="distclean">
    <mkdir dir="${rootdir}" />
    <mkdir dir="${rootdirr}" />
    <copy todir="${rootdirr}">
      <fileset dir=".">
	<include name="src/**/*.java" />
	<include name="src/*.java" />
	<include name="AUTHORS" />
	<include name="README" />
	<include name="TODO" />
	<include name="build.xml" />
      </fileset>
    </copy>

    <tar
      destfile="${tarball.name}"
      compression="bzip2"
      basedir="${rootdir}"
      />

    <delete dir="${rootdir}" />

  </target>


  <!--		DistClean				-->
  <target name="distclean" depends="clean">
    <delete dir="${jars.dir}" failonerror="false" />
  </target>

</project>
