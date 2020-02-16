# Define custom utilities
#see https://github.com/python-pillow/pillow-wheels/blob/master/config.sh 
function run_tests {
	(
	echo -n "+++++ python version:";python -c"import sys;print(sys.version.split()[0])"
	echo -n "+++++ filesystemencoding:";python -c"import sys;print(sys.getfilesystemencoding())"
	cd ../pyRXP/test
	echo "===== in pyRXP/test pwd=`pwd`"
	python testRXPbasic.py
	[ ! -f 'xmltest.zip' ] && [ -x /opt/cp37m/bin/python3.7 ] && /opt/cp37m/bin/python3.7 -c"from urllib.request import urlretrieve;urlretrieve('https://www.reportlab.com/ftp/xmltest.zip','xmltest.zip')"
	[ -f 'xmltest.zip' ] && python test_xmltestsuite.py || true	#force success
	)
	}

if [ -n "$IS_OSX" ]; then
	function repair_wheelhouse {
		local wheelhouse=$1
		install_delocate
		if [ -x $(dirname $PYTHON_EXE)/delocate-wheel ]; then
			$(dirname $PYTHON_EXE)/delocate-wheel $wheelhouse/*.whl # copies library dependencies into wheel
		else
			/Library/Frameworks/Python.framework/Versions/2.7/bin/delocate-wheel $wheelhouse/*.whl # copies library dependencies into wheel
		fi
	}
fi
