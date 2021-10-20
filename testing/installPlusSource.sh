python -m venv dune-env
. dune-env/bin/activate
pip install --pre --find-links file://$PWD/../dist dune.grid

# add dune-fem and test
cd ../repos
dune-common/bin/dunecontrol --only=dune-fem all
cd -
python -m dune.fem
cd fem_tutorial
pip list
python concepts.py
cd ..

# install dune-alugrid and test again
pip install --pre --find-links file://$PWD/../dist dune.alugrid
cd ../repos
dune-common/bin/dunecontrol --only=dune-fem all
cd -
python -m dune.fem
cd fem_tutorial
pip list
python laplace-adaptive.py
cd ..

# add dune-alugrid from source and test again
cd ../repos
dune-common/bin/dunecontrol --only=dune-alugrid all
dune-common/bin/dunecontrol --only=dune-fem all
cd -
python -m dune.fem
cd fem_tutorial
pip list
python laplace-adaptive.py
cd ..
