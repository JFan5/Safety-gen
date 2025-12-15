; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 318918514 --problem-name spanner-s3-n2-l4-s318918514
(define (problem spanner-s3-n2-l4-s318918514)
 (:domain spanner)
 (:objects 
     obj_06 - type_1
     obj_02 obj_11 obj_08 - type_5
     obj_01 obj_12 - type_4
     obj_09 obj_07 obj_10 obj_05 - type_3
     obj_03 obj_04 - type_3
    )
 (:init 
    (pred_3 obj_06 obj_03)
    (pred_3 obj_02 obj_10)
    (pred_5 obj_02)
    (pred_3 obj_11 obj_07)
    (pred_5 obj_11)
    (pred_3 obj_08 obj_10)
    (pred_5 obj_08)
    (pred_6 obj_01)
    (pred_3 obj_01 obj_04)
    (pred_6 obj_12)
    (pred_3 obj_12 obj_04)
    (pred_4 obj_03 obj_09)
    (pred_4 obj_05 obj_04)
    (pred_4 obj_09 obj_07)
    (pred_4 obj_07 obj_10)
    (pred_4 obj_10 obj_05)
)
 (:goal
  (and
   (pred_2 obj_01)
   (pred_2 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_01)) (not (pred_2 obj_12))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_03)))
  )
)
)
