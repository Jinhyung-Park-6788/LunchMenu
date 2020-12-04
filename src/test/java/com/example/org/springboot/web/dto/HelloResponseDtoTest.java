package com.example.org.springboot.web.dto;

import org.junit.Test;
import static org.assertj.core.api.Assertions.assertThat;

public class HelloResponseDtoTest {

    @Test
    public  void 롬복_기능_테스트() {
        //given
        String name = "test";
        int amount = 1000;

        HelloResponseDto dto = new HelloResponseDto(name, amount);

        //assertj는 assertion(주장, 행사)을 제공하는 자바 라이브러리
        //에러메시지와 테스트 코드의 가독성을 높 (VS Junit의 assertEqual)
        assertThat(dto.getName()).isEqualTo(name);
        assertThat(dto.getAmount()).isEqualTo(amount);

    }
}
