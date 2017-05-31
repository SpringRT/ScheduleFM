package com.a11.schedule.repository;

import com.a11.schedule.entity.Teacher;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeacherRepository extends CrudRepository<Teacher, Long> {
    List<Teacher> findByCathedraId(long id);
}
