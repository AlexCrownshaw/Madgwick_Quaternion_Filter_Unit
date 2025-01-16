from fixedpoint import FixedPoint


class GyroDerivative:

    def __init__(self):
        self.m = 0
        self.n = 0

    def compute(self, gyro: dict, q_half: dict) -> dict[str: FixedPoint]:
        q_dot_w = {
            "w": -q_half["x"] * gyro["x"] - q_half["y"] * gyro["y"] - q_half["z"] * gyro["z"],
            "x": q_half["w"] * gyro["x"] + q_half["y"] * gyro["z"] - q_half["z"] * gyro["y"],
            "y": q_half["w"] * gyro["y"] - q_half["x"] * gyro["z"] + q_half["z"] * gyro["x"],
            "z": q_half["w"] * gyro["z"] + q_half["x"] * gyro["y"] - q_half["y"] * gyro["x"],
        }

        self.m = q_dot_w["w"].m
        self.n = q_dot_w["w"].n

        return q_dot_w
