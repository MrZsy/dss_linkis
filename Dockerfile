FROM harbor.233bigdata.cn/dss_linkis/dss_linkis:dss_linkis_v25

RUN pip3 install --no-cache-dir -r /wedatasphere/docker/conf/requirements.txt -i  \
    http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com

COPY ./docker /wedatasphere/docker/
COPY ./sbin /wedatasphere/sbin/

RUN chown -R hdfs:hdfs /wedatasphere

RUN chmod +x /wedatasphere/docker/script/run.sh
WORKDIR /wedatasphere

CMD ["/bin/bash", "/wedatasphere/docker/script/run.sh"]