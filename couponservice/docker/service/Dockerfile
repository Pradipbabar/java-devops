FROM openjdk:11
ADD couponservice/couponservice-0.0.1-SNAPSHOT.jar couponservice-0.0.1-SNAPSHOT.jar
ENTRYPOINT [  "java", "-jar", "couponservice-0.0.1-SNAPSHOT.jar", "--spring.config.name=application", "--spring.config.url=s3://pradip-bucket-use/coupon.properties"]
