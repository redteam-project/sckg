import unittest

if __name__ == "__main__":
  suite = unittest.TestLoader().discover('tests/', pattern = "test_*.py")
  unittest.TextTestRunner(verbosity=4).run(suite)