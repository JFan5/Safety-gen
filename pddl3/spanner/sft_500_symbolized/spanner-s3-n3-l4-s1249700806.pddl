; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1249700806 --problem-name spanner-s3-n3-l4-s1249700806
(define (problem spanner-s3-n3-l4-s1249700806)
 (:domain spanner)
 (:objects 
     obj_05 - type_4
     obj_07 obj_08 obj_13 - type_3
     obj_10 obj_03 obj_12 - type_1
     obj_11 obj_04 obj_01 obj_02 - type_5
     obj_09 obj_06 - type_5
    )
 (:init 
    (pred_3 obj_05 obj_09)
    (pred_3 obj_07 obj_01)
    (pred_2 obj_07)
    (pred_3 obj_08 obj_02)
    (pred_2 obj_08)
    (pred_3 obj_13 obj_11)
    (pred_2 obj_13)
    (pred_4 obj_10)
    (pred_3 obj_10 obj_06)
    (pred_4 obj_03)
    (pred_3 obj_03 obj_06)
    (pred_4 obj_12)
    (pred_3 obj_12 obj_06)
    (pred_1 obj_09 obj_11)
    (pred_1 obj_02 obj_06)
    (pred_1 obj_11 obj_04)
    (pred_1 obj_04 obj_01)
    (pred_1 obj_01 obj_02)
)
 (:goal
  (and
   (pred_5 obj_10)
   (pred_5 obj_03)
   (pred_5 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_03)) (not (pred_5 obj_12))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_09)))
  )
)
)
