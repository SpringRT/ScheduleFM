package com.a11.schedule.repository;

import com.a11.schedule.entity.Faculty;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FacultyRepository extends CrudRepository<Faculty, Long> {
    List<Faculty> findByUniversityId(long id);
}
