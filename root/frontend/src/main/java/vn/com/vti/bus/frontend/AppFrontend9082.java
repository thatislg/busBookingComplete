package vn.com.vti.bus.frontend;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EnableAutoConfiguration
@ComponentScan
@MapperScan("vn.com.vti.bus.mapper")
public class AppFrontend9082 {
	public static void main(String[] args) {
		SpringApplication.run(AppFrontend9082.class, args);
	}
}
