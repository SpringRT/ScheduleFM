package com.a11.schedule.entity;

import javax.persistence.*;

@Entity
@Table(name = "subjects")
public class Subject {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;
    public String name;
    @Column(name = "teacher_id")
    public Long teacherId;

    public Subject() {}

    public Subject(String name, Long teacherId) {
        this.name = name;
        this.teacherId = teacherId;
    }
}
