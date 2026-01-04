; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1341275381 --problem-name spanner-s3-n3-l4-s1341275381
(define (problem spanner-s3-n3-l4-s1341275381)
 (:domain spanner)
 (:objects 
     obj_02 - type_2
     obj_01 obj_12 obj_04 - type_5
     obj_13 obj_10 obj_07 - type_3
     obj_11 obj_09 obj_08 obj_03 - type_1
     obj_06 obj_05 - type_1
    )
 (:init 
    (pred_6 obj_02 obj_06)
    (pred_6 obj_01 obj_08)
    (pred_4 obj_01)
    (pred_6 obj_12 obj_11)
    (pred_4 obj_12)
    (pred_6 obj_04 obj_09)
    (pred_4 obj_04)
    (pred_1 obj_13)
    (pred_6 obj_13 obj_05)
    (pred_1 obj_10)
    (pred_6 obj_10 obj_05)
    (pred_1 obj_07)
    (pred_6 obj_07 obj_05)
    (pred_5 obj_06 obj_11)
    (pred_5 obj_03 obj_05)
    (pred_5 obj_11 obj_09)
    (pred_5 obj_09 obj_08)
    (pred_5 obj_08 obj_03)
)
 (:goal
  (and
   (pred_2 obj_13)
   (pred_2 obj_10)
   (pred_2 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_10)) (not (pred_2 obj_07))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_06)))
  )
)
)
