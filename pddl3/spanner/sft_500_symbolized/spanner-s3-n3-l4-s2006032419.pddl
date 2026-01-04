; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2006032419 --problem-name spanner-s3-n3-l4-s2006032419
(define (problem spanner-s3-n3-l4-s2006032419)
 (:domain spanner)
 (:objects 
     obj_05 - type_3
     obj_07 obj_01 obj_06 - type_2
     obj_13 obj_02 obj_12 - type_4
     obj_10 obj_03 obj_11 obj_08 - type_5
     obj_09 obj_04 - type_5
    )
 (:init 
    (pred_5 obj_05 obj_09)
    (pred_5 obj_07 obj_10)
    (pred_3 obj_07)
    (pred_5 obj_01 obj_08)
    (pred_3 obj_01)
    (pred_5 obj_06 obj_10)
    (pred_3 obj_06)
    (pred_1 obj_13)
    (pred_5 obj_13 obj_04)
    (pred_1 obj_02)
    (pred_5 obj_02 obj_04)
    (pred_1 obj_12)
    (pred_5 obj_12 obj_04)
    (pred_6 obj_09 obj_10)
    (pred_6 obj_08 obj_04)
    (pred_6 obj_10 obj_03)
    (pred_6 obj_03 obj_11)
    (pred_6 obj_11 obj_08)
)
 (:goal
  (and
   (pred_2 obj_13)
   (pred_2 obj_02)
   (pred_2 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_13)) (not (pred_2 obj_02))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_09)))
  )
)
)
