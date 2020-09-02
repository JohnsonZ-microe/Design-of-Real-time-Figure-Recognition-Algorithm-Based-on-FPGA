# Design-of-Real-time-Figure-Recognition-Algorithm-Based-on-FPGA
As the mechine learning techniques being widely implemented in social and industrial field, it gives higher request to the accuracy of recognition of objects’feature. Based on the high-speed performance of FPGA platform, the algorithm proposed in this paper aims to extract the imformation of the gesture, mainly the skin color and contours. Using ellipse model color space division and gaussian function weighting structure, the algorithm can perfectly realize the combination of skin color and contours, and filter the irrelevant imformation effectively

该系统采用型号TRDB D5M的CCD器件获取视频流信息。经过拜尔插值与RGB转换处理，输入至SDRAM进行缓存原始视频图像，加入缓存的原因是采集数据量大、速度快，而发送数据量小、速度慢[6]。从SDRAM中读取图像数据，经过手势特征提取模块处理，最后经VGA输出。如图1所示。
手势提取模块首先采用手势信息的色彩域进行分析，发现经处理后手势信息的色彩域集中于一个椭圆区域，为了保证一定的环境适应性，采用二维高斯函数对手势的色彩域进行权值计算，最后加权到sobel边缘提取算法输出的边缘信息中，实现了针对60fps帧率下对手势边缘信息的提取与无关边缘信息的过滤。
