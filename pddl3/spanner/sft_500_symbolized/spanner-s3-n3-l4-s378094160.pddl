; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 378094160 --problem-name spanner-s3-n3-l4-s378094160
(define (problem spanner-s3-n3-l4-s378094160)
 (:domain spanner)
 (:objects 
     obj_03 - type_1
     obj_08 obj_04 obj_02 - type_4
     obj_07 obj_13 obj_09 - type_5
     obj_10 obj_12 obj_01 obj_06 - type_2
     obj_11 obj_05 - type_2
    )
 (:init 
    (pred_2 obj_03 obj_11)
    (pred_2 obj_08 obj_10)
    (pred_5 obj_08)
    (pred_2 obj_04 obj_06)
    (pred_5 obj_04)
    (pred_2 obj_02 obj_10)
    (pred_5 obj_02)
    (pred_6 obj_07)
    (pred_2 obj_07 obj_05)
    (pred_6 obj_13)
    (pred_2 obj_13 obj_05)
    (pred_6 obj_09)
    (pred_2 obj_09 obj_05)
    (pred_1 obj_11 obj_10)
    (pred_1 obj_06 obj_05)
    (pred_1 obj_10 obj_12)
    (pred_1 obj_12 obj_01)
    (pred_1 obj_01 obj_06)
)
 (:goal
  (and
   (pred_3 obj_07)
   (pred_3 obj_13)
   (pred_3 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_07)) (not (pred_3 obj_13))))
    (forall (?m - type_1) (at-most-once (pred_2 ?m obj_11)))
  )
)
)
