FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y tabix samtools fastqc picard-tools r-base openjdk-11-jdk bwa
RUN wget https://github.com/broadinstitute/gatk/releases/download/4.2.6.1/gatk-4.2.6.1.zip && \
    unzip gatk-4.2.6.1.zip && \
    mv gatk-4.2.6.1 /usr/local/gatk
RUN wget https://github.com/samtools/htslib/releases/download/1.9/htslib-1.9.tar.bz2 && \
    tar -vxjf htslib-1.9.tar.bz2 && \
    cd htslib-1.9 && \
    make && \
    make install

CMD ["/bin/bash"]
