; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2051854804 --problem-name spanner-s3-n3-l4-s2051854804
(define (problem spanner-s3-n3-l4-s2051854804)
 (:domain spanner)
 (:objects 
     obj_11 - type_1
     obj_06 obj_09 obj_07 - type_2
     obj_04 obj_12 obj_02 - type_4
     obj_01 obj_10 obj_05 obj_13 - type_3
     obj_08 obj_03 - type_3
    )
 (:init 
    (pred_5 obj_11 obj_08)
    (pred_5 obj_06 obj_05)
    (pred_2 obj_06)
    (pred_5 obj_09 obj_10)
    (pred_2 obj_09)
    (pred_5 obj_07 obj_05)
    (pred_2 obj_07)
    (pred_6 obj_04)
    (pred_5 obj_04 obj_03)
    (pred_6 obj_12)
    (pred_5 obj_12 obj_03)
    (pred_6 obj_02)
    (pred_5 obj_02 obj_03)
    (pred_4 obj_08 obj_01)
    (pred_4 obj_13 obj_03)
    (pred_4 obj_01 obj_10)
    (pred_4 obj_10 obj_05)
    (pred_4 obj_05 obj_13)
)
 (:goal
  (and
   (pred_3 obj_04)
   (pred_3 obj_12)
   (pred_3 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_12)) (not (pred_3 obj_02))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_08)))
  )
)
)
