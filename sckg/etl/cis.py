
from sckg.etl.generic import Generic

class CIS(Generic):

  def __init__(self, config):
    super().__init__(config)

  def transform(self, regime, regime_list):
    return []

