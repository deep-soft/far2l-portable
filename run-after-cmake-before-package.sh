    - name: Build
      working-directory: ${{github.workspace}}/build
      shell: bash
      # Execute the build.  You can specify a specific target with "--target <NAME>"
      run: cmake --build . --config $BUILD_TYPE

    - name: Remove extra languages
      working-directory: ${{github.workspace}}/build
      shell: bash
      run: |
        #touch 0-all-lng-hlf.txt
        #find . *.lng >> 0-all-lng-hlf.txt
        #find . *.hlf >> 0-all-lng-hlf.txt
        #lng_hlf_no_eng=$(grep.exe -i -v "eng\.\|e\.\|en\." 0-all-lng-hlf.txt)
        
        lng_hlf_no_eng=$(find . -name *.lng -o -name *.hlf | grep -i -v "eng\.\|en\.\|e\.")
        for lng_hlf in $lng_hlf_no_eng ; do
          echo "$lng_hlf";
          rm "$lng_hlf";
        done
