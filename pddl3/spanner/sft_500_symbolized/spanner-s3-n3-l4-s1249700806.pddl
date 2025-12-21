; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1249700806 --problem-name spanner-s3-n3-l4-s1249700806
(define (problem spanner-s3-n3-l4-s1249700806)
 (:domain spanner)
 (:objects 
     obj_07 - type_3
     obj_10 obj_11 obj_12 - type_5
     obj_05 obj_13 obj_04 - type_4
     obj_08 obj_02 obj_06 obj_01 - type_2
     obj_03 obj_09 - type_2
    )
 (:init 
    (pred_2 obj_07 obj_03)
    (pred_2 obj_10 obj_06)
    (pred_1 obj_10)
    (pred_2 obj_11 obj_01)
    (pred_1 obj_11)
    (pred_2 obj_12 obj_08)
    (pred_1 obj_12)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_09)
    (pred_5 obj_13)
    (pred_2 obj_13 obj_09)
    (pred_5 obj_04)
    (pred_2 obj_04 obj_09)
    (pred_6 obj_03 obj_08)
    (pred_6 obj_01 obj_09)
    (pred_6 obj_08 obj_02)
    (pred_6 obj_02 obj_06)
    (pred_6 obj_06 obj_01)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_13)
   (pred_3 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_13)) (not (pred_3 obj_04))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_03)))
  )
)
)
