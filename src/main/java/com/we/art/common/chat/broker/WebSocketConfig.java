package com.we.art.common.chat.broker;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

import com.we.art.common.interceptor.HttpHandShakeInterceptor;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer{



	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		System.out.println();
		registry.enableSimpleBroker("/queue");
		registry.setApplicationDestinationPrefixes("/");
	}
	
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		  registry.addEndpoint("/chat/direct/room1").withSockJS();
	}
}
