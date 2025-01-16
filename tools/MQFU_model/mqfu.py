import yaml
import pandas as pd
import numpy as np

from fixedpoint import FixedPoint
from jacobian import Jacobian
from normalise_vector import NormaliseVector
from gyro_derivative import GyroDerivative


class MQFU:

    Q_KEYS = ["w", "x", "y", "z"]

    def __init__(self, config_file: str, data_file: str, q_init: list = None):
        """
        Initializes the Madgwick class with parameters loaded from a YAML file.

        :param config_file: Path to the YAML configuration file.
        :param data_file: Path to file containing acc/gyro input data and quaternion output data (optional)
        """

        self.config: dict = self._load_config(config_file)
        self.data: pd.DataFrame = pd.read_csv(data_file)

        if q_init:
            self.q = {key: FixedPoint(q, signed=True, m=self.config["Q"]["m"], n=self.config["Q"]["n"]) for key, q in zip(self.Q_KEYS, q_init)}
        else:
            self.q = {key: FixedPoint(q, signed=True, m=self.config["Q"]["m"], n=self.config["Q"]["n"]) for key, q in zip(self.Q_KEYS, np.zeros(4))}

        if self.config["PROC_SENS_DATA"]["active"]:
            self.acc_sense_coeff_fix = FixedPoint(self.config["PROC_SENS_DATA"]["ACC"]["coeff"], signed=False, m=0, n=self.config["ACC"]["n"])
            self.gyro_sense_coeff_fix = FixedPoint(self.config["PROC_SENS_DATA"]["GYRO"]["coeff"], signed=False, m=0, n=self.config["GYRO"]["n"])

        self.J = Jacobian()
        self.acc_norm_obj = NormaliseVector(m=self.config["ACC"]["m"], n=self.config["ACC"]["n"], k=3)
        self.q_dot_w_obj = GyroDerivative()

    @staticmethod
    def _load_config(config_file_path: str) -> dict:
        """
        Loads the YAML configuration file as a dictionary.

        :param config_file_path: Path to the YAML file.
        :return: Dictionary with configuration parameters.
        """
        try:
            with open(config_file_path, 'r') as file:
                return yaml.safe_load(file)["parameters"]
        except FileNotFoundError:
            raise FileNotFoundError(f"Config file not found at: {config_file_path}")
        except yaml.YAMLError as e:
            raise ValueError(f"Error parsing YAML file: {e}")

    def run(self):
        """

        :return:
        """

        for idx, row in self.data.iterrows():
            if self.config["PROC_SENS_DATA"]["active"]:
                acc_fix_sens = {"x": FixedPoint(row.axRaw, signed=True, m=self.config["ACC"]["m"], n=self.config["ACC"]["n"]),
                                "y": FixedPoint(row.ayRaw, signed=True, m=self.config["ACC"]["m"], n=self.config["ACC"]["n"]),
                                "z": FixedPoint(row.azRaw, signed=True, m=self.config["ACC"]["m"], n=self.config["ACC"]["n"])}

                gyro_fix_sens = {"x": FixedPoint(row.wxRaw, signed=True, m=self.config["GYRO"]["m"], n=self.config["GYRO"]["n"]),
                                 "y": FixedPoint(row.wyRaw, signed=True, m=self.config["GYRO"]["m"], n=self.config["GYRO"]["n"]),
                                 "z": FixedPoint(row.wzRaw, signed=True, m=self.config["GYRO"]["m"], n=self.config["GYRO"]["n"])}

                acc_fix = acc_fix_sens * self.acc_sense_coeff_fix
                gyro_fix = gyro_fix_sens * self.gyro_sense_coeff_fix
            else:
                acc_fix = {"x": FixedPoint(row.ax, signed=True, m=self.config["ACC"]["m"], n=self.config["ACC"]["n"]),
                           "y": FixedPoint(row.ay, signed=True, m=self.config["ACC"]["m"], n=self.config["ACC"]["n"]),
                           "z": FixedPoint(row.az, signed=True, m=self.config["ACC"]["m"], n=self.config["ACC"]["n"])}

                gyro_fix = {"x": FixedPoint(row.wx, signed=True, m=self.config["GYRO"]["m"], n=self.config["GYRO"]["n"]),
                            "y": FixedPoint(row.wy, signed=True, m=self.config["GYRO"]["m"], n=self.config["GYRO"]["n"]),
                            "z": FixedPoint(row.wz, signed=True, m=self.config["GYRO"]["m"], n=self.config["GYRO"]["n"])}

            q_half_fix = {key: value >> 1 for key, value in self.q.items()}
            q_double_fix = {key: value << 1 for key, value in self.q.items()}

            self.J.compute(q_double_fix)

            acc_norm = self.acc_norm_obj.compute(x=acc_fix)
            q_dot_w = self.q_dot_w_obj.compute(gyro_fix, q_half_fix)

            print()