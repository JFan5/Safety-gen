; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1510091810 --problem-name spanner-s3-n3-l4-s1510091810
(define (problem spanner-s3-n3-l4-s1510091810)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_03 obj_05 obj_04 - type_2
     obj_08 obj_12 obj_01 - type_3
     obj_11 obj_07 obj_06 obj_02 - type_1
     obj_10 obj_13 - type_1
    )
 (:init 
    (pred_3 obj_09 obj_10)
    (pred_3 obj_03 obj_07)
    (pred_1 obj_03)
    (pred_3 obj_05 obj_02)
    (pred_1 obj_05)
    (pred_3 obj_04 obj_11)
    (pred_1 obj_04)
    (pred_4 obj_08)
    (pred_3 obj_08 obj_13)
    (pred_4 obj_12)
    (pred_3 obj_12 obj_13)
    (pred_4 obj_01)
    (pred_3 obj_01 obj_13)
    (pred_2 obj_10 obj_11)
    (pred_2 obj_02 obj_13)
    (pred_2 obj_11 obj_07)
    (pred_2 obj_07 obj_06)
    (pred_2 obj_06 obj_02)
)
 (:goal
  (and
   (pred_5 obj_08)
   (pred_5 obj_12)
   (pred_5 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_08)) (not (pred_5 obj_12))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_10)))
  )
)
)
