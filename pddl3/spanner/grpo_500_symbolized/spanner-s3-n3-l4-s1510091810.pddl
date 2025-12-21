; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1510091810 --problem-name spanner-s3-n3-l4-s1510091810
(define (problem spanner-s3-n3-l4-s1510091810)
 (:domain spanner)
 (:objects 
     obj_08 - type_5
     obj_05 obj_02 obj_12 - type_3
     obj_01 obj_10 obj_13 - type_1
     obj_03 obj_11 obj_07 obj_04 - type_2
     obj_06 obj_09 - type_2
    )
 (:init 
    (pred_6 obj_08 obj_06)
    (pred_6 obj_05 obj_11)
    (pred_5 obj_05)
    (pred_6 obj_02 obj_04)
    (pred_5 obj_02)
    (pred_6 obj_12 obj_03)
    (pred_5 obj_12)
    (pred_4 obj_01)
    (pred_6 obj_01 obj_09)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_09)
    (pred_4 obj_13)
    (pred_6 obj_13 obj_09)
    (pred_3 obj_06 obj_03)
    (pred_3 obj_04 obj_09)
    (pred_3 obj_03 obj_11)
    (pred_3 obj_11 obj_07)
    (pred_3 obj_07 obj_04)
)
 (:goal
  (and
   (pred_1 obj_01)
   (pred_1 obj_10)
   (pred_1 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_01)) (not (pred_1 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_06)))
  )
)
)
