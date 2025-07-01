package com.idp.bancodedados.video.infrastructure.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.idp.bancodedados.video.infrastructure.entitity.Video;

public interface VideoRepository extends  MongoRepository<Video, String>{
  Video findByTitulo(String titulo);
}
