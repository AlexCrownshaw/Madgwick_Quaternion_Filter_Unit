from mqfu import MQFU


if __name__ == "__main__":
    mqf = MQFU(config_file="config/fixed_point_config.yaml", data_file="plots/MPU6050_ESP32_10000_points.csv")
    mqf.run()
    mqf.acc_norm_obj.inv_sqrt_obj.plot_error(save_path="plots")
    print(mqf)
