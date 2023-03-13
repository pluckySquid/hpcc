#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=32G
#SBATCH --time=6-23:59:00     # 1 day and 15 minutes
#SBATCH --job-name="just_a_test"
//#SBATCH -p mxwanglab # This is the default partition, you can use any of the following; intel, batch, highmem, gpu
#SHATCH -p intel
#SBATCH --output=mxwanglab-%J.log

# Change to HOME dir to give access to all folders within Jupyter-Lab
cd $HOME
screen -S lab

# Jupyter vars
XDG_RUNTIME_DIR=""

# Get tunneling info
port=$(shuf -i8000-9999 -n1)
node=$(hostname -s)
user=$(whoami)
cluster=$(hostname -f | awk -F"." '{print $2}')

# Print tunneling instructions jupyter-log
echo -e "
MacOS or linux terminal command to create your ssh tunnel:
ssh -NL 8585:${node}:${port} ${user}@cluster.hpcc.ucr.edu

MS Windows MobaXterm info:

Forwarded port:same as remote port
Remote server: ${node}
Remote port: ${port}
SSH server: cluster.hpcc.ucr.edu
SSH login: $user
SSH port: 22
"

####################################################
# Load modules or activate conda environments here #
####################################################
#module unload miniconda2
#module load miniconda3
conda activate nxfl_env

# Print instructions to user
echo -e "PLEASE USE GENERATED URL BELOW IN BROWSER\nYOU MUST REPLACE '${node}' with 'localhost'"
echo $CUDA_VISIBLE_DEVICES
# Launch Jupyter lab or notebook
jupyter-lab --no-browser --port=${port} --ip=${node} --NotebookApp.max_buffer_size=24000000000
#jupyter-notebook --no-browser --port=${port} --ip=${node}
