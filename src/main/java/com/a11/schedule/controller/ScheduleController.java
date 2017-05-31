package com.a11.schedule.controller;

import com.a11.schedule.entity.Teacher;
import com.a11.schedule.service.EntityService;
import com.a11.schedule.service.ScheduleService;
import com.a11.schedule.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collection;

import static com.a11.schedule.service.ScheduleService.PAIR_INTERVALS;
import static com.a11.schedule.service.ScheduleService.WEEK_DAYS;

@Controller
@SuppressWarnings("unused")
public class ScheduleController {

    private final ScheduleService scheduleService;
    private final UserService userService;
    private final EntityService entityService;

    public ScheduleController(ScheduleService scheduleService, UserService userService, EntityService entityService) {
        this.scheduleService = scheduleService;
        this.userService = userService;
        this.entityService = entityService;
    }

    @GetMapping(value = "/schedule/{teacherId}")
    private ModelAndView teachers(
            @PathVariable long teacherId
    ) {
        Collection<String> subjects = scheduleService.getSubjects(teacherId).values();
        String[][] schedule = scheduleService.getSchedule(teacherId);
        return new ModelAndView("schedule")
                .addObject("teacherName", entityService.get(Teacher.class, teacherId).name)
                .addObject("isAdmin", userService.isAdmin())
                .addObject("isAuthorized", userService.isAuthorized())
                .addObject("subjects", subjects)
                .addObject("schedule", schedule)
                .addObject("pairIntervals", PAIR_INTERVALS)
                .addObject("weekDays", WEEK_DAYS)
                .addObject("id", teacherId);
    }
}
