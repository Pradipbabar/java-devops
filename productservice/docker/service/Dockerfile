FROM openjdk:11
ADD productservice/productservice-0.0.1-SNAPSHOT.jar productservice-0.0.1-SNAPSHOT.jar
ENTRYPOINT [ "java", "-jar", "productservice-0.0.1-SNAPSHOT.jar", "--spring.config.name=application", "--spring.config.url=s3://pradip-bucket-use/product.properties"]
