package com.idp.bancodedados.video.api.converter;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import com.idp.bancodedados.video.api.response.VideoResponseDto;
import com.idp.bancodedados.video.infrastructure.entitity.Video;

@Mapper(componentModel="spring")
public interface VideoMapper {

  @Mapping(target = "titulo",source="video.titulo")
  @Mapping(target = "descricao",source= "video.descricao")
  @Mapping(target = "urlVideo", source= "video.urlVideo")
  VideoResponseDto paraVideoResponseDto(Video video);
}
