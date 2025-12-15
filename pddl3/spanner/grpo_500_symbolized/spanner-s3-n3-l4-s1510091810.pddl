; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1510091810 --problem-name spanner-s3-n3-l4-s1510091810
(define (problem spanner-s3-n3-l4-s1510091810)
 (:domain spanner)
 (:objects 
     obj_10 - type_4
     obj_02 obj_01 obj_04 - type_5
     obj_03 obj_07 obj_08 - type_1
     obj_09 obj_12 obj_05 obj_13 - type_3
     obj_11 obj_06 - type_3
    )
 (:init 
    (pred_3 obj_10 obj_11)
    (pred_3 obj_02 obj_12)
    (pred_1 obj_02)
    (pred_3 obj_01 obj_13)
    (pred_1 obj_01)
    (pred_3 obj_04 obj_09)
    (pred_1 obj_04)
    (pred_5 obj_03)
    (pred_3 obj_03 obj_06)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_06)
    (pred_5 obj_08)
    (pred_3 obj_08 obj_06)
    (pred_4 obj_11 obj_09)
    (pred_4 obj_13 obj_06)
    (pred_4 obj_09 obj_12)
    (pred_4 obj_12 obj_05)
    (pred_4 obj_05 obj_13)
)
 (:goal
  (and
   (pred_2 obj_03)
   (pred_2 obj_07)
   (pred_2 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_03)) (not (pred_2 obj_07))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_11)))
  )
)
)
