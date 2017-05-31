package com.a11.schedule.repository;

import com.a11.schedule.entity.University;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UniversityRepository extends CrudRepository<University, Long> {
    List<University> findByCityId(long id);
}
