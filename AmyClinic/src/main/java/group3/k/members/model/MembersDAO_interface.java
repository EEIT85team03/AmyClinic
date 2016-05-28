package group3.k.members.model;

import java.util.*;

public interface MembersDAO_interface {
          public void insert(MembersVO memberVO);
          public void update(MembersVO memberVO);
          public void delete(Integer mid);
          public MembersVO findByPrimaryKey(Integer mid);
          public List<MembersVO> getAll();
}