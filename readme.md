 ### create a conda environemnt
  ```
conda create -n py37
conda activate py37
  ```

### Install Jupiter-lab
  ```
  conda install -c conda-forge jupyterlab
   ```

### run a job
  ```
sbatch submit_jupyter.sh  
  ```

### check a job
```
  squeue -u $USER
```
get following result:
```
  
               JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)                                                                                                                        
           8233625     intel just_a_t ywang112  R       0:06      1 i35    
```

### login to the vm
```
ssh i35
```
Type "yes" and you password when login

### quit from the vm
ctrl A + D

### cancel a job
```
scancel 8233625
```
