package de.otto.alternatives;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "de.otto.alternatives")
public class AlternativesApplication {

  public static void main(String[] args) {
    SpringApplication.run(AlternativesApplication.class, args);
  }

}
