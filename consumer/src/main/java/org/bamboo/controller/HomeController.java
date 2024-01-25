/*
 * Copyright 2014-2019 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.bamboo.controller;

import java.util.Collections;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author jitendra on 5/3/16.
 */
@RestController
public class HomeController {

	@GetMapping("/setValue")
	public String setValue(@RequestParam(name = "key", required = false) String key,
			@RequestParam(name = "value", required = false) String value, HttpServletRequest request) {
		if (!ObjectUtils.isEmpty(key) && !ObjectUtils.isEmpty(value)) {
			Object attribute = request.getSession().getAttribute(key);
			if (attribute != null){
				System.out.println(11111111111L);
			}else {
				request.getSession().setAttribute(key,value);
			}
		}
		System.out.println("ok............");
		return "home";
	}

}