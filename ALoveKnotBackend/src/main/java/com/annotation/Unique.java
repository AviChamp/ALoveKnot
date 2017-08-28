package com.annotation;

import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;
import static java.lang.annotation.ElementType.FIELD;
import java.lang.annotation.Retention;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Target({FIELD})
@Retention(RUNTIME)
@Constraint(validatedBy = {UniqueValidator.class})
public @interface Unique {

	String message();
	Class<?>[] groups() default { };
	Class<? extends Payload>[] payload() default { };
	
}
