; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1341275381 --problem-name spanner-s3-n3-l4-s1341275381
(define (problem spanner-s3-n3-l4-s1341275381)
 (:domain spanner)
 (:objects 
     obj_05 - type_5
     obj_08 obj_07 obj_12 - type_1
     obj_06 obj_02 obj_09 - type_2
     obj_11 obj_10 obj_01 obj_03 - type_3
     obj_13 obj_04 - type_3
    )
 (:init 
    (pred_5 obj_05 obj_13)
    (pred_5 obj_08 obj_01)
    (pred_2 obj_08)
    (pred_5 obj_07 obj_11)
    (pred_2 obj_07)
    (pred_5 obj_12 obj_10)
    (pred_2 obj_12)
    (pred_4 obj_06)
    (pred_5 obj_06 obj_04)
    (pred_4 obj_02)
    (pred_5 obj_02 obj_04)
    (pred_4 obj_09)
    (pred_5 obj_09 obj_04)
    (pred_3 obj_13 obj_11)
    (pred_3 obj_03 obj_04)
    (pred_3 obj_11 obj_10)
    (pred_3 obj_10 obj_01)
    (pred_3 obj_01 obj_03)
)
 (:goal
  (and
   (pred_6 obj_06)
   (pred_6 obj_02)
   (pred_6 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_02)) (not (pred_6 obj_09))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_13)))
  )
)
)
