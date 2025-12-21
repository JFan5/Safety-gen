; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 157407201 --problem-name spanner-s3-n2-l4-s157407201
(define (problem spanner-s3-n2-l4-s157407201)
 (:domain spanner)
 (:objects 
     obj_12 - type_3
     obj_05 obj_01 obj_11 - type_5
     obj_03 obj_02 - type_4
     obj_10 obj_06 obj_04 obj_09 - type_2
     obj_07 obj_08 - type_2
    )
 (:init 
    (pred_2 obj_12 obj_07)
    (pred_2 obj_05 obj_04)
    (pred_1 obj_05)
    (pred_2 obj_01 obj_04)
    (pred_1 obj_01)
    (pred_2 obj_11 obj_10)
    (pred_1 obj_11)
    (pred_5 obj_03)
    (pred_2 obj_03 obj_08)
    (pred_5 obj_02)
    (pred_2 obj_02 obj_08)
    (pred_6 obj_07 obj_10)
    (pred_6 obj_09 obj_08)
    (pred_6 obj_10 obj_06)
    (pred_6 obj_06 obj_04)
    (pred_6 obj_04 obj_09)
)
 (:goal
  (and
   (pred_3 obj_03)
   (pred_3 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_03)) (not (pred_3 obj_02))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_07)))
  )
)
)
