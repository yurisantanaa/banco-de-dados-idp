package com.idp.bancodedados.video.api.request;

import org.hibernate.validator.constraints.URL;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class VideoPostDTO {

    @NotBlank(message = "O título é obrigatório.")
    @Size(min = 3, max = 100, message = "O título deve ter entre 3 e 100 caracteres.")
    private String titulo;

    @NotBlank(message = "A descrição é obrigatória.")
    private String descricao;

    @NotBlank(message = "A URL é obrigatória.")
    @URL(message = "A URL fornecida é inválida.")
    private String url;

}