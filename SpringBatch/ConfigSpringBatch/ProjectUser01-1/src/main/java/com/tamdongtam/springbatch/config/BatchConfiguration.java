package com.tamdongtam.springbatch.config;


import javax.sql.DataSource;

import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.EnableBatchProcessing;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.core.launch.support.RunIdIncrementer;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.batch.core.repository.support.JobRepositoryFactoryBean;
import org.springframework.batch.core.step.tasklet.Tasklet;
import org.springframework.batch.item.ItemProcessor;
import org.springframework.batch.item.ItemReader;
import org.springframework.batch.item.ItemWriter;
import org.springframework.batch.item.database.BeanPropertyItemSqlParameterSourceProvider;
import org.springframework.batch.item.database.JdbcBatchItemWriter;
import org.springframework.batch.item.database.builder.JdbcBatchItemWriterBuilder;
import org.springframework.batch.item.file.FlatFileItemReader;
import org.springframework.batch.item.file.builder.FlatFileItemReaderBuilder;
import org.springframework.batch.item.file.mapping.BeanWrapperFieldSetMapper;
import org.springframework.batch.repeat.RepeatStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

import com.tamdongtam.springbatch.entity.Todo;

@Configuration
@EnableBatchProcessing
public class BatchConfiguration {

  @Autowired
  public JobBuilderFactory jobBuilderFactory;

  @Autowired
  public StepBuilderFactory stepBuilderFactory;
  
  @Autowired
  private DataSource dataSource;

  @Bean
  public FlatFileItemReader<Todo> reader() {
    return new FlatFileItemReaderBuilder<Todo>()
      .name("personItemReader")
      .resource(new ClassPathResource(""))//trỏ đến file đọc 
      .delimited()
      .names(new String[]{"id", "name"})
      .fieldSetMapper(new BeanWrapperFieldSetMapper<Todo>() {{
        setTargetType(Todo.class);
      }})
      .build();
  }
  
  @Bean
  public PersonItemProcessor processor() {
    return new PersonItemProcessor();
  }
  
  @Bean
  public JdbcBatchItemWriter<Todo> writer(DataSource dataSource) {
    return new JdbcBatchItemWriterBuilder<Todo>()
      .itemSqlParameterSourceProvider(new BeanPropertyItemSqlParameterSourceProvider<>())
      .sql("INSERT INTO Todo (id,name) VALUES (:id, :name)")
      .dataSource(dataSource)
      .build();
  }
  
//  @Bean
//  public Job importTodoJob(Step step1) {                 *** Em để config job 2 cái này đều lỗi  không chạy
//    return jobBuilderFactory.get("importTodoJob")            Anh giúp em với em thiếu hay sai ở đâu ạ  
//      .flow(step1)
//      .end()
//      .build();
//  }
//
//@Bean
//public Job ImportTodo(Step step1) throws Exception {
//    return jobBuilderFactory.get("ImportTodo")
//            .start(step1)
//            .build();
//}
//

  @Bean
  public Step step1() {
      return stepBuilderFactory.get("step1")
              .<Todo, Todo>chunk(10)
              .reader(reader())
              .processor(processor())
              .writer(writer(dataSource))
              .build();
  }



}