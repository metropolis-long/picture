package org.bamboo.controller;

import org.apache.dubbo.common.stream.StreamObserver;
import org.apache.dubbo.config.annotation.DubboReference;
import org.bamboo.pojo.Account;
import org.bamboo.pojo.Student;
import org.bamboo.service.StreamObserverService;
import org.bamboo.service.StudentService;

import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping
public class UserCtl {


    @DubboReference(version = "1.0")
    private StudentService studentService;


    @DubboReference
    private StreamObserverService streamObserverService;
    private final AuthenticationManager authenticationManager;

    public UserCtl(AuthenticationManager authenticationManager) {
        this.authenticationManager = authenticationManager;
    }

    @PostMapping("/login")
    public ResponseEntity<Void> login(@AuthenticationPrincipal Account account) {
        Authentication authenticationRequest =
                UsernamePasswordAuthenticationToken.unauthenticated(account.getUsername(), account.getPassword());
        Authentication authenticationResponse = this.authenticationManager.authenticate(authenticationRequest);
        ResponseEntity responseEntity = new ResponseEntity(HttpStatusCode.valueOf(200));
        return responseEntity;
    }
    @GetMapping("/time")
    public String get(){


        List<Student> bamboo = studentService.getStudents("bamboo");
        for (Student s :bamboo) {
            System.out.println("s = " + s);
        }
        return "66666666666";
    }

    @GetMapping("/st/{c}")
    public String testBI(@PathVariable String c){
        StreamObserver<String> streamObserver = streamObserverService.sayHelloStream(new StreamObserver<String>() {
            @Override
            public void onNext(String data) {
                System.out.println(data);
                System.out.println("返回数据了 "+data);
            }

            @Override
            public void onError(Throwable throwable) {

            }

            @Override
            public void onCompleted() {
                System.out.println("交流结束   onCompleted");
            }
        });

        streamObserver.onNext(c);
        streamObserver.onNext(c+"第二次");
        streamObserver.onCompleted();
        return "ok";
    }


}
