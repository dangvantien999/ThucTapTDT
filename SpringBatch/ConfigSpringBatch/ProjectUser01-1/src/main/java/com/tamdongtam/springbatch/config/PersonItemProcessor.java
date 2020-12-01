package com.tamdongtam.springbatch.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.batch.item.ItemProcessor;

import com.tamdongtam.springbatch.entity.Todo;

public class PersonItemProcessor implements ItemProcessor<Todo, Todo> {

  private static final Logger log = LoggerFactory.getLogger(PersonItemProcessor.class);

  @Override
  public Todo process(final Todo todo) throws Exception {
    final int id = todo.getId();
    final String name = todo.getName().toUpperCase();

    final Todo transformedPerson = new Todo();

    log.info("Converting (" + todo + ") into (" + transformedPerson + ")");

    return transformedPerson;
  }

}