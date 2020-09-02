# Design-of-Real-time-Figure-Recognition-Algorithm-Based-on-FPGA
As the mechine learning techniques being widely implemented in social and industrial field, it gives higher request to the accuracy of recognition of objects’feature. Based on the high-speed performance of FPGA platform, the algorithm proposed in this paper aims to extract the imformation of the gesture, mainly the skin color and contours. Using ellipse model color space division and gaussian function weighting structure, the algorithm can perfectly realize the combination of skin color and contours, and filter the irrelevant imformation effectively

该系统采用型号TRDB D5M的CCD器件获取视频流信息。经过拜尔插值与RGB转换处理，输入至SDRAM进行缓存原始视频图像，加入缓存的原因是采集数据量大、速度快，而发送数据量小、速度慢[6]。从SDRAM中读取图像数据，经过手势特征提取模块处理，最后经VGA输出。如图1所示。
手势提取模块首先采用手势信息的色彩域进行分析，发现经处理后手势信息的色彩域集中于一个椭圆区域，为了保证一定的环境适应性，采用二维高斯函数对手势的色彩域进行权值计算，最后加权到sobel边缘提取算法输出的边缘信息中，实现了针对60fps帧率下对手势边缘信息的提取与无关边缘信息的过滤。


![image](https://github.com/JohnsonZ-microe/Design-of-Real-time-Figure-Recognition-Algorithm-Based-on-FPGA/blob/master/images/1.png)

其中灰度信息从颜色域转换模块输出后，输入自适应边缘提取模块，该模块的目的在于提取出图像中的所有边缘信息。该模块示意图如下：
 
 ![image](https://github.com/JohnsonZ-microe/Design-of-Real-time-Figure-Recognition-Algorithm-Based-on-FPGA/blob/master/images/2.png)
 
 数据处理流程图如下
 
 ！[image](https://github.com/JohnsonZ-microe/Design-of-Real-time-Figure-Recognition-Algorithm-Based-on-FPGA/blob/master/images/3.png)
 
 手部肤色形成的聚类可以近似用一个椭圆域进行描述。通过二维高斯函数使得颜色值落在在此椭圆区域内的像素值获得较高的增益，同时远离此椭圆域的像素值得到抑制，实现了肤色信息的提取。高斯函数的拟合思路为：1.对图中的红色区域求其包络椭圆曲线。 2.对得到的椭圆曲线匹配相应的二维高斯函数，使像素值在椭圆域边界处，权值为1。为对高斯权值计算模块进行时序匹配，使边缘像素所对应的高斯权值与边缘像素同时输出，由于自适应sobel滤波延时2行+7clk,故该模块所占时序也应为2行+7clk。模块设计示意图如下：
 
 ！[image](https://github.com/JohnsonZ-microe/Design-of-Real-time-Figure-Recognition-Algorithm-Based-on-FPGA/blob/master/images/4.png)
 
 高斯权值将与sobel处理后的边缘值进行加权运算，然后通过卷积方式检测像素点的邻域，并对邻域中的所有高斯值计算均值，只要邻域中存在一点为肤色区域，其高斯权数便能为该像素值带来较高的增益，而若邻域中不存在色彩值满足要求的点，则高斯权数将对像素值进行抑制，故做如下设计
 ！[image](https://github.com/JohnsonZ-microe/Design-of-Real-time-Figure-Recognition-Algorithm-Based-on-FPGA/blob/master/images/5.png)
  
 本系统设计采用Verilog HDL语言进行描述，目标器件为Altera 的CycloneⅡEP2C35F672C6，摄像头采用TRDB-D5M CCD摄像头，片上资源使用报告如下
 ！[image](https://github.com/JohnsonZ-microe/Design-of-Real-time-Figure-Recognition-Algorithm-Based-on-FPGA/blob/master/images/6.png)
 
 板上实验验证效果如下：
  ！[image](https://github.com/JohnsonZ-microe/Design-of-Real-time-Figure-Recognition-Algorithm-Based-on-FPGA/blob/master/images/7.png)
