package com.idp.bancodedados.video.api.service;

import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.idp.bancodedados.video.api.request.VideoPostDTO;
import com.idp.bancodedados.video.infrastructure.entitity.Video;
import com.idp.bancodedados.video.infrastructure.repository.VideoRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class VideoService {

  private final VideoRepository repository;

  public Optional<Video> buscarVideo(String titulo) {
    try {
      Optional<Video> video = repository.findByTitulo(titulo);
      return video;
    } catch (Exception e) {
      throw new RuntimeException("erro ao buscar titulo " + titulo);
    }
  }

    public Video criarVideo(@RequestBody VideoPostDTO video) {
        Video novoVideo = new Video(video);
        novoVideo = repository.save(novoVideo);
        return novoVideo;
    }
}
