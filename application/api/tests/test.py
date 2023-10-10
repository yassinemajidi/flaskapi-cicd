import unittest
import warnings
from ..src.handlers import images


class UnitTest(unittest.TestCase):

    def setUp(self):
        warnings.simplefilter("ignore", ResourceWarning)

    def tearDown(self):
        pass

    def test_transform(self):
        print("\n\nTesting the get image function")
        expected_result = "https://picsum.photos/300/200"

        result = images.get_image_url()

        self.assertEqual(result, expected_result)


if __name__ == '__main__':
    unittest.main()
