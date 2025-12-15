; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 831419845 --problem-name spanner-s3-n2-l4-s831419845
(define (problem spanner-s3-n2-l4-s831419845)
 (:domain spanner)
 (:objects 
     obj_08 - type_4
     obj_04 obj_05 obj_02 - type_3
     obj_01 obj_11 - type_2
     obj_06 obj_12 obj_03 obj_10 - type_5
     obj_07 obj_09 - type_5
    )
 (:init 
    (pred_1 obj_08 obj_07)
    (pred_1 obj_04 obj_03)
    (pred_3 obj_04)
    (pred_1 obj_05 obj_06)
    (pred_3 obj_05)
    (pred_1 obj_02 obj_03)
    (pred_3 obj_02)
    (pred_4 obj_01)
    (pred_1 obj_01 obj_09)
    (pred_4 obj_11)
    (pred_1 obj_11 obj_09)
    (pred_6 obj_07 obj_06)
    (pred_6 obj_10 obj_09)
    (pred_6 obj_06 obj_12)
    (pred_6 obj_12 obj_03)
    (pred_6 obj_03 obj_10)
)
 (:goal
  (and
   (pred_5 obj_01)
   (pred_5 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_01)) (not (pred_5 obj_11))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_07)))
  )
)
)
