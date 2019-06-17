# setup
cmake -DENABLE_HEADLESS_RENDERING=OFF \
                 -DPYTHON_EXECUTABLE:FILEPATH=$(which python) ../CMakeLists.txt 

# build
make -j
make install-pip-package

# clean up
make clean
git clean -fd

# test
python -c "import open3d; assert 'capture_depth_point_cloud' in dir(open3d.visualization.Visualizer), 'capture_depth_point_cloud is not available...'"

