from fixedpoint import FixedPoint


class Jacobian:
    m: int = 0
    n: int = 0
    fix: dict[str: FixedPoint] = {"11_24": 0,
                                  "12_23": 0,
                                  "13_22": 0,
                                  "14_210": 0,
                                  "32": 0,
                                  "33": 0}

    def compute(self, q_double: dict) -> None:
        self.fix["11_24"] = q_double["y"]
        self.fix["12_23"] = q_double["z"]
        self.fix["13_22"] = q_double["w"]
        self.fix["14_210"] = q_double["x"]
        self.fix["32"] = self.fix["14_210"] * 2
        self.fix["33"] = self.fix["11_24"] * 2

        self.m = self.fix["11_24"].m
        self.n = self.fix["11_24"].n
