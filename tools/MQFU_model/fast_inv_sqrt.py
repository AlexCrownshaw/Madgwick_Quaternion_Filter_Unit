import os
import struct
import math

import numpy as np
import matplotlib.pyplot as plt

from fixedpoint import FixedPoint


class FastInvSqrt:

    HEX_CONST: int = 0x5f3759df

    def __init__(self, m, n):
        """
        Initialize the fixed-point configuration.

        :param m: Number of integer bits in the fixed-point representation.
        :param n: Number of fractional bits in the fixed-point representation.
        """

        self.m = m
        self.n = n
        self.one_and_half = FixedPoint(1.5, signed=False, m=self.m, n=self.n)
        self.data = []

    def compute(self, x: float) -> FixedPoint:
        """
        Perform the fixed-point fast inverse square root calculation and log the result.

        :param x: Float input number.
        :return: Fixed-point result of the fast inverse square root.
        """

        x_fixed = FixedPoint(x, signed=False, m=self.m, n=self.n)
        x_uint32 = struct.unpack('I', struct.pack('f', x))[0]

        x_half = x_fixed >> 1

        y0_int = self.HEX_CONST - (x_uint32 >> 1)
        y0_float = struct.unpack('f', struct.pack('I', y0_int))[0]
        y0_fix = FixedPoint(y0_float, signed=False, m=self.m, n=self.n, overflow='clamp', overflow_alert="warning")

        A = x_half * y0_fix * y0_fix
        B = self.one_and_half - A
        y_fix_temp = y0_fix * B
        y = FixedPoint(float(y_fix_temp), signed=False, m=self.m, n=self.n, overflow='clamp', overflow_alert="warning")
        y_float = float(y)

        try:
            actual_sqrt = 1 / math.sqrt(x)
        except ZeroDivisionError:
            actual_sqrt = math.inf

        error = abs(y_float - actual_sqrt)

        self.data.append([x, y, y_float, actual_sqrt, error])

        return y

    def get_logs(self):
        """
        Retrieve the computation logs as a NumPy array.

        :return: NumPy array of logged computations.
        """
        return np.array(self.data, dtype=object)

    def plot_error(self, save_path: str = "") -> None:
        """
        Create a scatter plot of the percentage error against x from the log data.
        """
        if not self.data:
            print("No data to plot. Please run some computations first.")
            return

        # Convert log data to a NumPy array
        logs = self.get_logs()

        # Extract values
        x_values = logs[:, 0]  # Input x
        y_float = logs[:, 2]  # Calculated y_float
        errors = logs[:, 4]  # Absolute errors

        # Calculate percentage error
        percentage_error = (errors / y_float) * 100

        plt.figure(figsize=(5, 2.5))  # Width x Height in inches

        # Scatter plot with optimized marker size
        plt.scatter(x_values, percentage_error, alpha=0.75, s=5, marker="x")  # Small, clear markers

        # Logarithmic scale for x-axis
        plt.xscale('log')

        # Adjust x-axis ticks for clarity
        x_ticks = [1, 10, 100, 500, 1000, 2000]
        plt.xticks(x_ticks, labels=[str(tick) for tick in x_ticks], fontsize=8)
        plt.yticks(fontsize=8)

        # Set labels and title with smaller fonts
        plt.title("Percentage Error of Fixed-Point Fast Inverse Square Root", fontsize=8)
        plt.xlabel("Input (x) - Log Scale", fontsize=8)
        plt.ylabel("Percentage Error (%)", fontsize=8)

        # Grid styling
        plt.grid(True, which="both", linestyle="--", linewidth=0.5)

        # Tighter layout to remove unnecessary whitespace
        plt.tight_layout()

        # Save the figure as high-resolution for IEEE papers
        plt.savefig(os.path.join(save_path, "fast_inv_sqrt_error_ieee.tiff"), dpi=300, format="tiff", bbox_inches="tight")
        plt.savefig(os.path.join(save_path, "fast_inv_sqrt_error_ieee.eps"), format="eps", bbox_inches="tight")

        # Show the plot
        plt.show()
