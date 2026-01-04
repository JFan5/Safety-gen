; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2128974424 --problem-name spanner-s3-n3-l4-s2128974424
(define (problem spanner-s3-n3-l4-s2128974424)
 (:domain spanner)
 (:objects 
     obj_06 - type_2
     obj_05 obj_01 obj_07 - type_5
     obj_12 obj_11 obj_03 - type_3
     obj_02 obj_10 obj_04 obj_08 - type_4
     obj_13 obj_09 - type_4
    )
 (:init 
    (pred_1 obj_06 obj_13)
    (pred_1 obj_05 obj_04)
    (pred_3 obj_05)
    (pred_1 obj_01 obj_04)
    (pred_3 obj_01)
    (pred_1 obj_07 obj_04)
    (pred_3 obj_07)
    (pred_5 obj_12)
    (pred_1 obj_12 obj_09)
    (pred_5 obj_11)
    (pred_1 obj_11 obj_09)
    (pred_5 obj_03)
    (pred_1 obj_03 obj_09)
    (pred_6 obj_13 obj_02)
    (pred_6 obj_08 obj_09)
    (pred_6 obj_02 obj_10)
    (pred_6 obj_10 obj_04)
    (pred_6 obj_04 obj_08)
)
 (:goal
  (and
   (pred_2 obj_12)
   (pred_2 obj_11)
   (pred_2 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_11)) (not (pred_2 obj_03))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_13)))
  )
)
)
