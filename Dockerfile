FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y tabix samtools fastqc picard-tools gatk htslib r-base openjdk-11-jdk bwa

CMD ["/bin/bash"]
