package vn.com.vti.bus.backend;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EnableAutoConfiguration
@ComponentScan
@MapperScan("vn.com.vti.bus.mapper")
public class AppBackend9081 {
	public static void main(String[] args) {
		SpringApplication.run(AppBackend9081.class, args);
	}
}
