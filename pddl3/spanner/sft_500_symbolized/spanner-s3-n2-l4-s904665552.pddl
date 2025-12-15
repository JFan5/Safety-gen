; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 904665552 --problem-name spanner-s3-n2-l4-s904665552
(define (problem spanner-s3-n2-l4-s904665552)
 (:domain spanner)
 (:objects 
     obj_09 - type_1
     obj_01 obj_10 obj_02 - type_4
     obj_08 obj_12 - type_2
     obj_04 obj_06 obj_03 obj_07 - type_3
     obj_11 obj_05 - type_3
    )
 (:init 
    (pred_5 obj_09 obj_11)
    (pred_5 obj_01 obj_04)
    (pred_1 obj_01)
    (pred_5 obj_10 obj_04)
    (pred_1 obj_10)
    (pred_5 obj_02 obj_04)
    (pred_1 obj_02)
    (pred_6 obj_08)
    (pred_5 obj_08 obj_05)
    (pred_6 obj_12)
    (pred_5 obj_12 obj_05)
    (pred_4 obj_11 obj_04)
    (pred_4 obj_07 obj_05)
    (pred_4 obj_04 obj_06)
    (pred_4 obj_06 obj_03)
    (pred_4 obj_03 obj_07)
)
 (:goal
  (and
   (pred_3 obj_08)
   (pred_3 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_08)) (not (pred_3 obj_12))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_11)))
  )
)
)
