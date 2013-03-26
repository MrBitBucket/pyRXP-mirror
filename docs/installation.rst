2. Installation and Setup
=========================

We make available pre-built Windows binaries. On other platforms you can
build it from source using distutils. pyRXP is a single extension module
with no other dependencies outside Python itself.

2.1 Windows binary - pyRXP.pyd
------------------------------

ReportLab's FTP server has a win32-dlls directory, which is sub-divided
into Python versions. Each of these has the version of the pyd file
suitable for use with that version of Python. So, the version we use
with Python 2.2 is at

::

    http://www.reportlab.com/ftp/win32-dlls/2.2/pyRXP.pyd

Download the pyRXP DLL from the ReportLab FTP site. Save the pyRXP.pyd
in the DLLs directory under your Python installation (eg this is the
C:\\Python22\\DLLs directory for a standard Windows installation of
Python 2.2).

2.2 Source Code installation
----------------------------

The source code is open source under the GPL. This is available on
SourceForge.

The source for pyRXP and a slightly patched version of RXP is made
available by anonymous CVS at

::

    :pserver:anonymous@cvs.reportlab.sourceforge.net:/cvsroot/reportlab

To get the source use the commands

::

    cvs -d :pserver:anonymous@cvs.reportlab.sourceforge.net:/cvsroot/reportlab login
    cvs -d :pserver:anonymous@cvs.reportlab.sourceforge.net:/cvsroot/reportlab co rl_addons/pyRXP

enter a carriage return for the password.

If you have obtained the source code in the way described above, the
rl\_addons/pyRXP directory should contain a distutils script, setup.py
which should be run with argument install or build. If successful a
shared library pyRXP.pyd or pyRXP.so should be built.

2.2.1 Post installation tests
-----------------------------

Whichever method you used to get pyRXP installed, you should run the
short test suite to make sure there haven't been any problems.

Cd to the rl\_addons/pyRXP/test directory and run the file
testRXPbasic.py.

If you have built the Unicode aware version (pyRXPU.pyd or pyRXPU.so,
only available in the source distribution at the moment), running the
test program should show you this:

::

    C:\tmp\rl_addons\pyRXP\test>python testRXPbasic.py
    ..........................................
    42 tests, no failures!

If you have only installed the standard (8-bit) pyRXP, you should see
something like this:

::

    C:\tmp\rl_addons\pyRXP\test>testRXPbasic.py
    .....................
    21 tests, no failures!

These are basic health checks, which are the minimum required to make
sure that nothing drastic is wrong. This is the very least that you
should do - you should not skip this step!

If you want to be more thorough, there is a much more comprehensive test
suite which tests XML compliance. This is run by a file called
test\_xmltestsuite.py, also in the test directory. This depends on a set
of more than 300 tests written by James Clark which you can download in
the form of a zip file from

::

    http://www.reportlab.com/ftp/xmltest.zip

or

::

    ftp://ftp.jclark.com/pub/xml/xmltest.zip

You can simply drop this in the test directory and run the
test\_xmltestsuite file which will automatically unpack and use it.

2.3 Examples
------------

We have made available a small directory of example stuff to play with.
This will be superceded by the release of the framework soon. As such
there is no formal package location for it; unzip anywhere you want.

::

    http://www.reportlab.com/ftp/pyRXP_examples.zip

The examples directory includes a couple of substantial XML files with
DTDs, a wrapper module called *xmlutils* which provides easy access to
the tuple tree, and the beginnings of a benchmarking script. The
benchmark script tries to find lots of XML parsers on your system. Both
are documented in section 4 below.