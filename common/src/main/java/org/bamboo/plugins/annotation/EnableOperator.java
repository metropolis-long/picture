package org.bamboo.plugins.annotation;

import org.bamboo.plugins.register.OperatorComponentRegister;
import org.springframework.context.annotation.Import;

import java.lang.annotation.*;

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Import(value = {OperatorComponentRegister.class})
@Inherited
@Documented
public @interface EnableOperator {

    String[] value() default {};
}
