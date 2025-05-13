package edu.idp.bancodedados.ap9.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.idp.bancodedados.ap9.persistence.models.Usuario;
import edu.idp.bancodedados.ap9.persistence.models.UsuarioRepository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class CadastroController {
  @Autowired
  UsuarioRepository usuarioRepository;

  @PostMapping("/cadastro")
  public @ResponseBody String cadastroUsuario(@RequestBody String entity) {
      Usuario usuario = new Usuario();
      usuario.setNome(entity);
      usuario.setSobrenome(entity);
      usuario.setEmail(entity);
      usuario.setCpf(entity);
      usuarioRepository.save(usuario);
      return "cadastro realizado com sucesso";
  }

  @GetMapping("/mostrar-usuarios")
  public @ResponseBody Iterable<Usuario> getMethodName() {
      return usuarioRepository.findAll();
  }
  
  
}
