package com.idp.bancodedados.video.api.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.idp.bancodedados.video.api.request.VideoPostDTO;
import com.idp.bancodedados.video.api.service.VideoService;
import com.idp.bancodedados.video.infrastructure.entitity.Video;

import jakarta.websocket.server.PathParam;


@RestController
@RequestMapping("/videos")
public class VideoController {

  @Autowired
  VideoService videoService;

  @GetMapping("/{titulo}")
  public ResponseEntity<Video> buscarVideo(@PathParam(value = "titulo") String titulo) {
      Optional<Video> videoOptional = videoService.buscarVideo(titulo);
      return videoOptional
                .map(video -> new ResponseEntity<>(video, HttpStatus.OK))
                .orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
  }

  @PostMapping
  public ResponseEntity<Video> criarVideo(@RequestBody VideoPostDTO video) {
        Video novoVideo = videoService.criarVideo(video);
        return new ResponseEntity<>(novoVideo, HttpStatus.CREATED);
    }
  
}
