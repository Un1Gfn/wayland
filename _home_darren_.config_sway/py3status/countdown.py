# https://py3status.readthedocs.io/en/latest/writing_modules.html
# /usr/lib/python3.8/site-packages/py3status/modules/imap.py

from datetime import date as d
from datetime import datetime as dt

class Py3status:

    # available configuration parameters
    cache_timeout = 60

    def countdown(self):

        # format = str(dt.now())

        # format = ""
        # # format += "weKILLpedia "
        # format += "<span color='#0000FF'>weKILLpedia "
        # format += str((d.today()-d(2019,4,23)).days+1) + "</span>"
        # format += "  <span color='#222222'>AntiELAB "
        # format += str((d.today()-d(2019,6,9)).days+1) + "</span>"
        # format += "  <span color='#FF0000'>Final "
        # format += str((d(2020,1,5)-d.today()).days) + "</span>"

        format = ""
        # format += "<span color='#00FF00'>"
        # format += str((d.today()-d()).days+1)
        # format += "</span>  "
        format += "weKILLpedia "
        format += str((d.today()-d(2019,4,23)).days+1)
        format += "  AntiELAB "
        format += str((d.today()-d(2019,6,9)).days+1)
        format += "  Coronavirus "
        format += str((d.today()-d(2019,12,1)).days+1)

        return {
            # 'full_text': self.format,
            # 'cached_until': self.py3.CACHE_FOREVER
            'full_text': format,
            "cached_until": self.py3.time_in(self.cache_timeout)
        }

