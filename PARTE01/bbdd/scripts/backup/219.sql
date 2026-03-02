ALTER TABLE titles ADD CONSTRAINT
  fk_titles_pub_id FOREIGN KEY (pub_id)
  references publishers(pub_id);
