; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1249700806 --problem-name spanner-s3-n3-l4-s1249700806
(define (problem spanner-s3-n3-l4-s1249700806)
 (:domain spanner)
 (:objects 
     obj_01 - type_1
     obj_06 obj_04 obj_03 - type_2
     obj_12 obj_02 obj_08 - type_4
     obj_07 obj_11 obj_05 obj_10 - type_5
     obj_13 obj_09 - type_5
    )
 (:init 
    (pred_2 obj_01 obj_13)
    (pred_2 obj_06 obj_05)
    (pred_3 obj_06)
    (pred_2 obj_04 obj_10)
    (pred_3 obj_04)
    (pred_2 obj_03 obj_07)
    (pred_3 obj_03)
    (pred_1 obj_12)
    (pred_2 obj_12 obj_09)
    (pred_1 obj_02)
    (pred_2 obj_02 obj_09)
    (pred_1 obj_08)
    (pred_2 obj_08 obj_09)
    (pred_6 obj_13 obj_07)
    (pred_6 obj_10 obj_09)
    (pred_6 obj_07 obj_11)
    (pred_6 obj_11 obj_05)
    (pred_6 obj_05 obj_10)
)
 (:goal
  (and
   (pred_4 obj_12)
   (pred_4 obj_02)
   (pred_4 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_02)) (not (pred_4 obj_08))))
    (forall (?m - type_1) (at-most-once (pred_2 ?m obj_13)))
  )
)
)
