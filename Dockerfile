FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y tabix samtools fastqc picard-tools htslib r-base openjdk-11-jdk bwa
RUN wget https://github.com/broadinstitute/gatk/releases/download/4.2.6.1/gatk-4.2.6.1.zip && \
    unzip gatk-4.2.6.1.zip && \
    mv gatk-4.2.6.1 /usr/local/gatk

CMD ["/bin/bash"]
