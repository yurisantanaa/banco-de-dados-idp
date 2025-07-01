package com.idp.bancodedados.video.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.idp.bancodedados.video.api.response.VideoResponseDto;
import com.idp.bancodedados.video.api.service.VideoService;

import jakarta.websocket.server.PathParam;


@Controller
@RequestMapping("/videos")
public class VideoController {

  @Autowired
  VideoService videoService;

  @GetMapping("/{titulo}")
  public ResponseEntity<VideoResponseDto> buscarVideo(@PathParam(value = "titulo") String titulo) {
      return ResponseEntity.ok(videoService.buscarVideo(titulo));
  }
  
  
}
