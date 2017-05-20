from gnuradio import gr, gr_unittest
from gnuradio import blocks
import howtogen_swig as howtogen

class qa_square_bb (gr_unittest.TestCase):

    def setUp (self):
        self.tb = gr.top_block ()

    def tearDown (self):
        self.tb = None
    
    def test_000_square_ff(self):
        src_data = (2-3j,3+4j)
        expected_result = (-5-12j,-7+24j)
        src = blocks.vector_source_c(src_data)
        sqr = howtogen.square_cc()
        dst = blocks.vector_sink_c()
        self.tb.connect(src, sqr)
        self.tb.connect(sqr, dst)
        self.tb.run()
        result_data = dst.data()
        self.assertComplexTuplesAlmostEqual(expected_result, result_data, 6)

if __name__ == '__main__':
    gr_unittest.run(qa_square_bb, "qa_square_bb.xml")
