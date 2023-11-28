1.  Export the metrics (like request per second, memory usage, cpu usage etc) in the existing mini project given to Interns

2. Install Prometheus and Grafana using Docker (with docker-compose)

3. Configure prometheus (scrape configs) such way that it can scrape the metrics from default metric path of the application job

4. Validate the entire configuration to check if the data is coming or not in Prometheus UI

5. Create the Dashboards in Grafana on top of the metrics exported by adding the Prometheus as a Datasource.<br><br><br>



#### Make some changes in the python file to export metrics to prometheus to create endpoints for it to scrape.<br>

1. request_counter = Counter('flask_requests_total', 'Total number of requests received')
    This line creates a Prometheus Counter named flask_requests_total with the description 'Total number of requests received'.
    A Counter is a metric that represents a cumulative count that only goes up.

2. cpu_usage = Gauge('flask_cpu_usage_percent', 'CPU usage percentage')
    This line creates a Prometheus Gauge named flask_cpu_usage_percent with the description 'CPU usage percentage'.
     A Gauge is a metric that represents a single numerical value that can go up or down.

3.
   ```
    @app.route('/metrics')
    def metrics():
      cpu_percent = psutil.cpu_percent()
      cpu_usage.set(cpu_percent)
      return generate_latest(REGISTRY)
   ```
 

##### Create and upload an image of the target project to DockerHub from which we need to export metrics. Create a `deployment.yml` file and `service.yml` file and deploy the image and to run the target app. 

##### Create a docker-compose file to create docker container's prometheus and grafana.

Add the following line to mount local file prometheus.yml to the /etc/prometheus/prometheus.yml file inside the Docker container. This helps in configuring the prometheus.<br>

```
volumes:
- ./prometheus.yml:/etc/prometheus/prometheus.yml
```

To run the docker-compose use command `sudo docker-compose up -d`


##### Create a prometheus.yml file to configure the prometheus and for prometheus to give target to ot to scrap for metrics.<br>

Add `targets: ['192.168.59.100:30070']` under static clocal file prometheus.yml to the /etc/prometheus/prometheus.yml file inside the Docker container.onfig in prometheus.yml file to specify the target url.

##### Now run `sudo docker-compose up -d` command to start the prometheus and grafana. 

##### In web browser go to `http://localhost:9090/ for prometheus UI. <br>
Under status in the nav bar go to targets section.

![Screenshot from 2023-11-28 12-34-41](https://github.com/Venkat21-2000/Prometheus_assingnment/assets/106486649/5e671010-9bf5-4ed5-87d0-0ffecf37635e)

Validate the entire configuration to check if the data is coming or not in Prometheus UI<br>


![Screenshot from 2023-11-28 12-37-32](https://github.com/Venkat21-2000/Prometheus_assingnment/assets/106486649/fe8c0af9-ca4f-4b7e-adbf-8272f3938ffa)

<br>

#### In web browser go to `http://localhost:3000/ for Grafana UI.

#### In the below select add data source to select the data source<br>

![Screenshot from 2023-11-28 12-39-32](https://github.com/Venkat21-2000/Prometheus_assingnment/assets/106486649/a7608cc6-a337-4c92-a590-43418c40d3e2)
<br>
#### select prometheus and enter the url as shown in the image<br>
![Screenshot from 2023-11-28 12-39-57](https://github.com/Venkat21-2000/Prometheus_assingnment/assets/106486649/86cf9f21-bf00-4395-99bc-c28a9a98b560)
<br>

#### Create the Dashboards in Grafana on top of the metrics exported by adding the Prometheus as a Datasource.<br>



![Screenshot from 2023-11-28 12-47-32](https://github.com/Venkat21-2000/Prometheus_assingnment/assets/106486649/41062093-5a0b-47a5-96da-1d9dc27b2dee)
<br>
#### For cpu usage metrics<br>

![Screenshot from 2023-11-28 12-44-09](https://github.com/Venkat21-2000/Prometheus_assingnment/assets/106486649/7d571574-4cdb-41be-b106-82dd80afe57f)







