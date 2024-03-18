@CALL "%~dp0micromamba.exe" create -n triposr python==3.10.9 git==2.41.0 git-lfs==3.2.0 -c pytorch -c conda-forge -r "%~dp0\" -y
@CALL "%~dp0micromamba.exe" shell init --shell cmd.exe --prefix "%~dp0\"
@CALL condabin\micromamba.bat activate triposr
@CALL set GDOWN_CACHE=cache\gdown
@CALL set TORCH_HOME=cache\torch
@CALL set HF_HOME=cache\huggingface
@CALL set PYTHONDONTWRITEBYTECODE=1
@CALL pip install torch==2.0.1+cu118 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
@CALL pip install xformers==0.0.20
@CALL pip uninstall torchmcubes
@CALL pip install git+https://github.com/tatsy/torchmcubes.git
@CALL pip install --upgrade setuptools
@CALL pip install -r requirements.txt
@CALL git clone https://github.com/VAST-AI-Research/TripoSR .\TripoSR
@CALL mkdir TripoSR\cache\gdown\
@CALL mkdir TripoSR\cache\torch\
@CALL mkdir TripoSR\cache\huggingface\
@CALL mkdir TripoSR\repositories\
@CALL cd TripoSR
@CALL python gradio_app.py
@CALL PAUSE