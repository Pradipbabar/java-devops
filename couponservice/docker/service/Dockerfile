FROM openjdk:11
ADD couponservice/couponservice-0.0.1-SNAPSHOT.jar couponservice-0.0.1-SNAPSHOT.jar
ENTRYPOINT [ "java", "-jar", "couponservice-0.0.1-SNAPSHOT.jar", "--spring.config.name=coupon", "--spring.config.url=https://pradip-bucket-use.s3.amazonaws.com/coupon.properties" ]
