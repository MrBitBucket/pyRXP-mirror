5. Future Directions
====================

5.1 Test Suite
--------------

We urgently need a unittest-based suite full of samples saying 'parse
this XML with these flags and assert fact X about the output'. If done
right, this could be used to generate the documentation on the parser
flags as well. It will be very important when allowing pluggable
parsers.

In the meantime, there are some simple tests. Look at the file
test\\t.py.

5.2 Standardize the Wrapper
---------------------------

A standard wrapper class to let you 'drill down' into the tuple tree.
This should be as pythonic as possible.

5.3 Other parsers
-----------------

Include tuple tree constructors based on other parsers. One could use
pyexpat (in fact a few lines could be added to pyexpat itself to produce
a tuple tree in some future version of Python). This would be useful for
people who cannot install extensions but have Python 2.0 or above. We
also have our own parser, Aaron Watters' rparsexml, which uses no C code
and is thus useful in places where you cannot build extensions. The
latter is not guaranteed to be 100% standards compliant, but this means
we can modify it to handle bad XML.

5.4 Better Benchmark Suite
--------------------------

Extend this so that it knows about more parsers and (if possible) can
detect the memory used by them without needing to pause and look in Task
Manager. Ensure we are being fair to competitors and using their parsers
optimally.

5.5 Type Conversion Utility
---------------------------

In the parsed output, everything is a string. Yet XML is full of
attributes which "mean" numeric values. In particular our own Report
Markup Language has numerous attributes like *x, y, width, height*, as
well as color attributes. It would be really useful to generalize the
conversion step. Let's say you can provide a mapping like this

::

    1.  (tag, attribute) -> reader function
    2.   attribute -> reader function

Many of the reader functions are just *int* or *float*; others could be
written in Python or C. For example we have standard length expressions
like "3cm" or "8.5in" which we convert to float values in points. This
could say that (a) if this tag name and attribute name has a converter
function, use it in-place; (b) if the attribute name has a converter,
use that; and if (c) there is nothing specified, leave it as a string.

So the tree could be converted "in place" with a simple API call, at
C-like speeds. And we'd be able to remove a lot of code from our
application and replace it with a very simple mapping. Expect this real
soon now!

Note that this type-conversion is not an XML standard. The one true way
is probably to use XML Schema; but for now this is not possible as we
don't have a schema-validating parser, and we are big fans of stuff that
works now.

5.6 Source File References
--------------------------

Debug/trace info: add an extra structure to show the position in the
original source file where the tag starts and finished. This would be a
parse-time option, as you might not want to take the time and memory.
This would let an application raise an error saying not just that the
color tag contained a bad color value, but also that it occurred at line
2352 of the input. Useful! This is why we reserved the final tuple
element for future use.

5.7 (longer term and debatable) Richer Tuple Tree Structure
-----------------------------------------------------------

It has been suggested that we expand the structure in a couple of ways.
Instead of tuples we could make a new C-based node object with a richer
model.

Each node should have some pointer back to its parent. This makes
navigation a lot easier, but means a little more housekeeping.

We could then also let you distinguish things like CDATA and entity
nodes and make it a fully rewritable DOM implementation, running at
C-like speeds. We could even go further and keep references to things
like comments, which are not part of the XML standard.

PyRXP meets our needs already and we won't rush into this. Still, it
might be an attractive enhancement for a future version of Python;
essentially one would make a lightweight XML node into a built-in type.

ReportLab
 165 The Broadway
 Wimbledon
 London, UK SW19 1NE
