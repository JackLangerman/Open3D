
# mkdir -p build
# cd build

# bash ../util/scripts/install-deps-osx.sh

conda install libpng jpeg pkg-config jsoncpp eigen -y
conda install -c ryanvolz libusb  -y
conda install -c menpo glfw3  -y
conda install -c conda-forge glew  -y


cmake -DENABLE_HEADLESS_RENDERING=OFF \
                 -DPYTHON_EXECUTABLE:FILEPATH=$(which python) ../CMakeLists.txt 

# cd ..

make -j


make install-pip-package


make clean


# test
python -c "import open3d; assert 'capture_depth_point_cloud' in dir(open3d.visualization.Visualizer), 'capture_depth_point_cloud is not available...'"

