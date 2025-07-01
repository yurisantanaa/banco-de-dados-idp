package com.idp.bancodedados.video.infrastructure.entitity;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import com.idp.bancodedados.video.api.request.VideoPostDTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Document(collection= "videos")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Video {

  @Id
  private String id;
  private String titulo;
  private String descricao;
  private String urlVideo;
  private int curtidas;
  private List<String> comentarios;

  public Video(VideoPostDTO dto) {
        this.titulo = dto.getTitulo();
        this.descricao = dto.getDescricao();
        this.urlVideo = dto.getUrl();
        this.curtidas = 0;
        this.comentarios = new ArrayList<>();
    }
}
