; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 157407201 --problem-name spanner-s3-n2-l4-s157407201
(define (problem spanner-s3-n2-l4-s157407201)
 (:domain spanner)
 (:objects 
     obj_03 - type_2
     obj_04 obj_09 obj_06 - type_3
     obj_12 obj_07 - type_4
     obj_08 obj_02 obj_05 obj_01 - type_1
     obj_11 obj_10 - type_1
    )
 (:init 
    (pred_3 obj_03 obj_11)
    (pred_3 obj_04 obj_05)
    (pred_6 obj_04)
    (pred_3 obj_09 obj_05)
    (pred_6 obj_09)
    (pred_3 obj_06 obj_08)
    (pred_6 obj_06)
    (pred_5 obj_12)
    (pred_3 obj_12 obj_10)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_10)
    (pred_1 obj_11 obj_08)
    (pred_1 obj_01 obj_10)
    (pred_1 obj_08 obj_02)
    (pred_1 obj_02 obj_05)
    (pred_1 obj_05 obj_01)
)
 (:goal
  (and
   (pred_2 obj_12)
   (pred_2 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_12)) (not (pred_2 obj_07))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_11)))
  )
)
)
