#special case import to allow reportlab to modify the envirnment in development
try:
    import reportlab
except ImportError:
    pass

import leaktest, testRXPbasic, test_xmltestsuite

leaktest.main(100)
testRXPbasic.main()
test_xmltestsuite.main()
