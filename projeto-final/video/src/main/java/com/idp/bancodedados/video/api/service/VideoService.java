package com.idp.bancodedados.video.api.service;

import org.springframework.stereotype.Service;

import com.idp.bancodedados.video.api.converter.VideoMapper;
import com.idp.bancodedados.video.api.response.VideoResponseDto;
import com.idp.bancodedados.video.infrastructure.entitity.Video;
import com.idp.bancodedados.video.infrastructure.repository.VideoRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class VideoService {

  private final VideoRepository repository;
  private final VideoMapper mapper;
  
  public VideoResponseDto buscarVideo(String titulo) {
    try {
      Video video = repository.findByTitulo(titulo);
      return mapper.paraVideoResponseDto(video);
    } catch (Exception e) {
      throw new RuntimeException();
    }
  }
}
