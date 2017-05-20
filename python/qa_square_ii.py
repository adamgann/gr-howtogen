from gnuradio import gr, gr_unittest
from gnuradio import blocks
import howtogen_swig as howtogen

class qa_square_bb (gr_unittest.TestCase):

    def setUp (self):
        self.tb = gr.top_block ()

    def tearDown (self):
        self.tb = None
    
    def test_001_square_bb(self):
        src_data = (2, 3, 4, 5, 6)
        expected_result = (4, 9, 16, 25, 36)
        src = blocks.vector_source_i(src_data)
        sqr = howtogen.square_ii()
        dst = blocks.vector_sink_i()
        self.tb.connect(src, sqr)
        self.tb.connect(sqr, dst)
        self.tb.run()
        result_data = dst.data()
        self.assertFloatTuplesAlmostEqual(expected_result, result_data, 6)

if __name__ == '__main__':
    gr_unittest.run(qa_square_bb, "qa_square_bb.xml")
