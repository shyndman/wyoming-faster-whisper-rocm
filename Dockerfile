FROM rocm/pytorch:latest

RUN apt-get update && apt-get -y install nano ffmpeg libomp-dev libssl-dev
RUN curl https://sh.rustup.rs -sSf | \
    sh -s -- --default-toolchain stable -y
RUN . "$HOME/.cargo/env" && \
    pip install -U pip && \
    pip install -vv wyoming==1.6.0 faster-whisper==1.1.1 tokenizers==0.21.1

RUN pip install auditwheel setuptools

COPY src /src

WORKDIR /src
# RUN git clone https://github.com/arlo-phoenix/CTranslate2-rocm.git --recurse-submodules
# RUN conda init
RUN ./build.sh
RUN ./build_py.sh

RUN conda init

ENTRYPOINT ["/src/run.sh"]
# ENTRYPOINT ["tail", "-f", "/dev/null"]
