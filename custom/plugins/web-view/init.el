Content-Type: text/enriched
Text-Width: 70





(<x-color><param>#b6a0ff</param>defun</x-color> <x-color><param>#feacd0</param>extract-subfolders-as-dot-string</x-color> (directory-path)
  <x-color><param>#9ac8e0</param>"Extract subfolders after the last '</x-color><x-color><param>#00bcff</param><x-color><param>#9ac8e0</param>src</x-color></x-color><x-color><param>#9ac8e0</param>' and convert them to a dot-separated string."</x-color>
  (message <x-color><param>#79a8ff</param>"    Calcualting ns for: %s"</x-color> directory-path)
  (<x-color><param>#b6a0ff</param>let*</x-color> ((directory-list (split-string directory-path <x-color><param>#79a8ff</param>"/"</x-color>))
	 (directory-list (delete <x-color><param>#79a8ff</param>""</x-color> directory-list))
         (last-src-index (cl-position <x-color><param>#79a8ff</param>"src"</x-color> directory-list
				      <x-color><param>#f78fe7</param>:from-end</x-color> t
				      <x-color><param>#f78fe7</param>:test</x-color> 'equal))

	 (relevant-list (nthcdr (1+ last-src-index) directory-list))

	 (relevant-list (<x-color><param>#b6a0ff</param>if</x-color> (string= (nth 0 relevant-list) <x-color><param>#79a8ff</param>"main"</x-color>)
			  (nthcdr 1 relevant-list)
			  relevant-list)))
    (message <x-color><param>#79a8ff</param>"        Calcualting ns for: %s"</x-color> directory-list)
    (message <x-color><param>#79a8ff</param>"        Found src on: %s"</x-color> last-src-index)
    (message <x-color><param>#79a8ff</param>"        Relevent list: %s"</x-color> relevant-list)
    (<x-color><param>#b6a0ff</param>if</x-color> last-src-index
        (string-join relevant-list <x-color><param>#79a8ff</param>"."</x-color>)
      directory-path)))

;<x-color><param>#989898</param>(extract-subfolders-as-dot-string "path/to/src/la")
</x-color>
(<x-color><param>#b6a0ff</param>defun</x-color> <x-color><param>#feacd0</param>generate-files-from-templates</x-color> ()
  <x-color><param>#9ac8e0</param>"Generate files from templates in the '</x-color><x-color><param>#00bcff</param><x-color><param>#9ac8e0</param>templates</x-color></x-color><x-color><param>#9ac8e0</param>' folder."</x-color>
  (<x-color><param>#b6a0ff</param>interactive</x-color>)
  (<x-color><param>#b6a0ff</param>let*</x-color> ((output-folder (read-directory-name <x-color><param>#79a8ff</param>"Target directory (View will be subfolder of this folder): "</x-color>))
         (view-name (read-string <x-color><param>#79a8ff</param>"Enter a view-name "</x-color>))

	 (view-file (string-replace <x-color><param>#79a8ff</param>"-"</x-color> <x-color><param>#79a8ff</param>"_"</x-color>  (copy-sequence view-name)))

	 (target-folder (concat output-folder <x-color><param>#79a8ff</param>"/"</x-color> view-file))
	 (templates-folder <x-color><param>#79a8ff</param>"/home/wzhpor/alpha/edd-core-web/templates/project/src/projectname/home"</x-color>)
         (template-files (directory-files templates-folder nil <x-color><param>#79a8ff</param>"\\.cljs$"</x-color>))
         (number-of-templates (length template-files)))


    (<x-color><param>#b6a0ff</param>unless</x-color> (file-directory-p target-folder)
      (make-directory target-folder t))

    (message <x-color><param>#79a8ff</param>"Target dir %s"</x-color> target-folder)

    (message <x-color><param>#79a8ff</param>"Render view %s"</x-color> view-name)

    (<x-color><param>#b6a0ff</param>when</x-color> (> number-of-templates 0)
      (<x-color><param>#b6a0ff</param>dolist</x-color> (template-file template-files)
        (message <x-color><param>#79a8ff</param>"Rndering template at %s"</x-color> template-file)
        (<x-color><param>#b6a0ff</param>let*</x-color> ((template-path (expand-file-name template-file templates-folder))
               (template-contents (<x-color><param>#b6a0ff</param>with-temp-buffer</x-color>
                                   (insert-file-contents template-path)
                                   (buffer-string)))
	       (namespace (extract-subfolders-as-dot-string output-folder))
	       (template-contents (string-replace
				   <x-color><param>#79a8ff</param>"projectname"</x-color>
				   namespace
				   template-contents))
               (template-contents (string-replace
				   <x-color><param>#79a8ff</param>"home"</x-color>
				   view-name
				   template-contents))

	       
               (output-file (expand-file-name template-file target-folder)))
          (message <x-color><param>#79a8ff</param>"     File ns %s for view: %s"</x-color> namespace view-name)
          (<x-color><param>#b6a0ff</param>with-temp-file</x-color> output-file
            (insert template-contents)))))))

(global-set-key (kbd <x-color><param>#79a8ff</param>"C-c C-g"</x-color>) 'generate-files-from-templates)


