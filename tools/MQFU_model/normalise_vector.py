import math

from fast_inv_sqrt import FastInvSqrt
from fixedpoint import FixedPoint


class NormaliseVector:

    def __init__(self, n: int, m: int, k: int):
        """

        :param n: Integer length
        :param m: Fractional length
        :param k: Size of input vector x
        """

        self.m = m
        self.n = n
        self.sqr_sum_m = 2 * m + math.ceil(math.log2(k))
        self.mag_sqr_n = 2 * n
        self.inv_sqrt_obj = FastInvSqrt(self.sqr_sum_m, self.mag_sqr_n)
        self.log = []

    def compute(self, x: dict[str: FixedPoint]) -> dict:
        """

        :param x: Input vector to be normalised
        :return:
        """

        sqr_sum = FixedPoint(0, signed=False)
        for element in x.values():
            sqr_sum += element * element

        inv_sqrt_fix = self.inv_sqrt_obj.compute(x=float(sqr_sum))

        y_temp = {key: value * inv_sqrt_fix for key, value in x.items()}

        y = {key: FixedPoint(float(value), signed=True, m=self.m, n=self.n) for key, value in y_temp.items()}

        self.log.append({
            "sqr_sum": sqr_sum,
            "inv_sqrt_fix": inv_sqrt_fix,
            "y_temp": {key: value for key, value in y_temp.items()},
            "y": {key: value for key, value in y.items()}
        })

        return y
