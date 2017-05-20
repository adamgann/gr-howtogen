/* -*- c++ -*- */

#define HOWTOGEN_API

%include "gnuradio.i"			// the common stuff

//load generated python docstrings
%include "howtogen_swig_doc.i"

%{
#include "howtogen/square_bb.h"
#include "howtogen/square_ss.h"
#include "howtogen/square_ii.h"
#include "howtogen/square_ff.h"
#include "howtogen/square_cc.h"
%}

%include "howtogen/square_bb.h"
%include "howtogen/square_ss.h"
%include "howtogen/square_ii.h"
%include "howtogen/square_ff.h"
%include "howtogen/square_cc.h"

GR_SWIG_BLOCK_MAGIC2(howtogen, square_bb);
GR_SWIG_BLOCK_MAGIC2(howtogen, square_ss);
GR_SWIG_BLOCK_MAGIC2(howtogen, square_ii);
GR_SWIG_BLOCK_MAGIC2(howtogen, square_ff);
GR_SWIG_BLOCK_MAGIC2(howtogen, square_cc);



