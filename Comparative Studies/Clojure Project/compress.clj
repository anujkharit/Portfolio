(ns compress
  (:require [clojure.string :as str]))

(defn load-word-frequencies [file]
  (->> (slurp file)
       (str/split-lines)
       (map #(str/split % #"\s+"))
       (map (fn [[word freq]]
              (let [parsed-freq (try
                                  (Integer/parseInt freq)
                                  (catch NumberFormatException _ 0))] ; Assign default value 0 for non-integer frequencies
                [word parsed-freq])))
       (into {})))

(defn tokenize [text]
  (str/split text #"\s+"))

(defn compress-text [text word-frequencies]
  (let [words (tokenize text)
        word-map (zipmap (map key word-frequencies) (range))]
    (str/join " " (map #(get word-map % (count word-map)) words))))

(defn decompress-text [text word-frequencies]
  (let [word-list (str/split text #"\s+")
        word-map (zipmap (map val word-frequencies) (map key word-frequencies))]
    (str/join " " (map #(get word-map (Integer/parseInt %) %) word-list))))

(defn compress-file [input-file output-file frequencies-file]
  (let [word-frequencies (load-word-frequencies frequencies-file)]
    (with-open [in-file (clojure.java.io/reader (str "/root/comp6411/" input-file))
                out-file (clojure.java.io/writer (str "/root/comp6411/" output-file))]
      (let [text (str/join " " (line-seq in-file))
            compressed-text (compress-text text word-frequencies)]
        (spit (str "/root/comp6411/" output-file) compressed-text)))))

(defn decompress-file [input-file frequencies-file]
  (let [word-frequencies (load-word-frequencies frequencies-file)]
    (with-open [in-file (clojure.java.io/reader (str "/root/comp6411/" input-file))]
      (let [text (str/join " " (line-seq in-file))
            decompressed-text (decompress-text text word-frequencies)]
        (println decompressed-text)))))

;; Usage examples:
(compress-file "text1.txt" "output.txt" "frequency.txt")
(decompress-file "output.txt" "frequency.txt")
