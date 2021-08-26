def main():
    import sys, os
    wd = os.path.dirname(os.path.abspath(sys.argv[0]))
    sys.path.insert(0,wd)
    os.chdir(wd)
    
    #special case import to allow reportlab to modify the envirnment in development
    try:
        import reportlab
    except ImportError:
        pass

    import leaktest, testRXPbasic, test_xmltestsuite

    leaktest.main(100)
    testRXPbasic.main()
    test_xmltestsuite.main()

if __name__=='__main__':
    main()
