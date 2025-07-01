package com.idp.bancodedados.video.infrastructure.repository;

import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.idp.bancodedados.video.infrastructure.entitity.Video;

public interface VideoRepository extends  MongoRepository<Video, String>{
  Optional<Video> findByTitulo(String titulo);
}
