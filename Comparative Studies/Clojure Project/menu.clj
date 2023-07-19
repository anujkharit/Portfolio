(ns menu
  (:require [clojure.string :as str]
            [clojure.java.io :as io]
            [compress :as comp]))

;;displaying menu
(defn display-menu []
  (println "Menu:")
  (println "1. Display list of files")
  (println "2. Display file content")
  (println "3. Compress a file")
  (println "4. Decompress a file")
  (println "5. Exit"))



(defn display-file []
  (print "Enter the file name: ")
  (let [filename (read-line)]
    (let [filepath (str "/root/comp6411/" filename)] ;;reads the file name
      (if (.exists (io/file filepath)) ;; checks if file exits or not
        (let [text (slurp filepath)] 
          (println text))
        (println "Invalid file name.")))))


;; display the lis of files
(defn display-list []
  (let [files (io/file ".")]
    (doseq [file (file-seq files)] 
      (when (.isFile file)
        (println (.getName file))))))

;;compression file.
(defn compress-file []
  (print "Enter the input file name: ")
  (let [input-file (read-line)]
    (print "Enter the output file name: ")
    (let [output-file (read-line)]
      (print "Enter the frequencies file name: ")
      (let [frequencies-file (read-line)]
        (let [word-frequencies (comp/load-word-frequencies frequencies-file)]   ;;frequency of word count take place
          (with-open [in-file (io/reader (str "/root/comp6411/" input-file))  ;;read the file 
                      out-file (io/writer (str "/root/comp6411/" output-file))]
            (let [text (str/join " " (line-seq in-file))  ;;join the string
                  compressed-text (comp/compress text word-frequencies)]
              (spit (str "/root/comp6411/" output-file) compressed-text))))
        (println (str "File '" input-file "' compressed to '" output-file "'."))
        (println "Compression completed.")))))


;;decompression file
(defn decompress-file []
  (print "Enter the input file name: ")
  (let [input-file (read-line)]
    (print "Enter the frequencies file name: ")
    (let [frequencies-file (read-line)]
      (comp/decompress-file input-file frequencies-file)
      (println (str "File '" input-file "' decompressed."))
      (println "Decompression completed."))))

;;get user input
(defn user-input []
  (print "Enter your choice: ")
  (read))

(defn process-choice [choice]
  (cond
    (= choice 1) (do
                   (println "Displaying list of files...")
                   (display-list))
    (= choice 2) (do
                   (println "Displaying file contents...")
                   (display-file))
    (= choice 3) (do
                   (println "Compressing a file...")
                   (compress-file))
    (= choice 4) (do
                   (println "Decompressing a file...")
                   (decompress-file))
    (= choice 5) (println "Exiting...")
    :else (do (println "Invalid choice. Please try again.")
              (process-choice (user-input)))))
;;main function
(defn -main []
  (loop []
    (display-menu)
    (let [choice (user-input)]
      (if (= choice 5)
        (do (process-choice choice)
            (println "Thank you"))
        (do (process-choice choice)
            (recur))))))

(-main)
