FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y tabix samtools fastqc picard-tools r-base openjdk-11-jdk \
    bwa wget vim build-essential bcftools zlib1g-dev python3 python3-pip perl \
    liblzma-dev libcurl4-openssl-dev libbz2-dev
RUN wget https://github.com/broadinstitute/gatk/releases/download/4.2.6.1/gatk-4.2.6.1.zip && \
    unzip gatk-4.2.6.1.zip && \
    mv gatk-4.2.6.1 /usr/local/gatk
RUN wget https://github.com/samtools/htslib/releases/download/1.9/htslib-1.9.tar.bz2 && \
    tar -vxjf htslib-1.9.tar.bz2 && \
    cd htslib-1.9 && \
    make && \
    make install
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN apt-get update && apt-get install -y python3-venv && python3 -m venv /opt/venv && /bin/bash -c "source /opt/venv/bin/activate && pip install open-cravat pytabix"
RUN echo '#!/bin/bash\nsource /opt/venv/bin/activate\nexec "$@"' > /usr/local/bin/entrypoint.sh && chmod +x /usr/local/bin/entrypoint.sh
RUN mv /opt/venv/lib/python3.12/site-packages/cravat /tmp/cravat && ln -s /tmp/cravat /opt/venv/lib/python3.12/site-packages/cravat



ENV PATH="/opt/venv/bin:$PATH"
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["/bin/bash"]
