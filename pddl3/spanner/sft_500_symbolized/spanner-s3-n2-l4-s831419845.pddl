; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 831419845 --problem-name spanner-s3-n2-l4-s831419845
(define (problem spanner-s3-n2-l4-s831419845)
 (:domain spanner)
 (:objects 
     obj_01 - type_4
     obj_06 obj_02 obj_04 - type_1
     obj_07 obj_09 - type_3
     obj_08 obj_05 obj_10 obj_12 - type_5
     obj_03 obj_11 - type_5
    )
 (:init 
    (pred_5 obj_01 obj_03)
    (pred_5 obj_06 obj_10)
    (pred_6 obj_06)
    (pred_5 obj_02 obj_08)
    (pred_6 obj_02)
    (pred_5 obj_04 obj_10)
    (pred_6 obj_04)
    (pred_2 obj_07)
    (pred_5 obj_07 obj_11)
    (pred_2 obj_09)
    (pred_5 obj_09 obj_11)
    (pred_1 obj_03 obj_08)
    (pred_1 obj_12 obj_11)
    (pred_1 obj_08 obj_05)
    (pred_1 obj_05 obj_10)
    (pred_1 obj_10 obj_12)
)
 (:goal
  (and
   (pred_4 obj_07)
   (pred_4 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_07)) (not (pred_4 obj_09))))
    (forall (?m - type_4) (at-most-once (pred_5 ?m obj_03)))
  )
)
)
