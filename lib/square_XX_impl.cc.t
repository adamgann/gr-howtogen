/* -*- c++ -*- */
/* 
 * Copyright 2014 <+YOU OR YOUR COMPANY+>.
 * 
 * This is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 * 
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street,
 * Boston, MA 02110-1301, USA.
 */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <gnuradio/io_signature.h>
#include <@NAME_IMPL@.h>

namespace gr {
  namespace howtogen {

    @NAME@::sptr @NAME@::make()
    {
      return gnuradio::get_initial_sptr(new @NAME_IMPL@());
    }


    @NAME_IMPL@::@NAME_IMPL@()
      : gr::sync_block("@NAME@",
              gr::io_signature::make(1,1, sizeof(@I_TYPE@)),
              gr::io_signature::make(1,1, sizeof(@O_TYPE@)))
    {}

    @NAME_IMPL@::~@NAME_IMPL@() 
    {}

    int
    @NAME_IMPL@::work(int noutput_items,
			  gr_vector_const_void_star &input_items,
			  gr_vector_void_star &output_items)
    {
        @I_TYPE@ *in = (@I_TYPE@ *) input_items[0];
        @O_TYPE@ *out = (@O_TYPE@ *) output_items[0];

        for(int ii=0;ii<noutput_items;ii++)
        {
          out[ii] = in[ii]*in[ii];
        }
        
        return noutput_items;
    }

  } /* namespace howtogen */
} /* namespace gr */


