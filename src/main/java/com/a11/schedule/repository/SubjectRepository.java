package com.a11.schedule.repository;

import com.a11.schedule.entity.Subject;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SubjectRepository extends CrudRepository<Subject, Long> {

    List<Subject> findByTeacherId(long id);
}
