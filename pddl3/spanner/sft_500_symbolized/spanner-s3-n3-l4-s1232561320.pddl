; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1232561320 --problem-name spanner-s3-n3-l4-s1232561320
(define (problem spanner-s3-n3-l4-s1232561320)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_10 obj_13 obj_04 - type_1
     obj_05 obj_01 obj_06 - type_3
     obj_03 obj_12 obj_11 obj_02 - type_2
     obj_09 obj_08 - type_2
    )
 (:init 
    (pred_5 obj_07 obj_09)
    (pred_5 obj_10 obj_11)
    (pred_3 obj_10)
    (pred_5 obj_13 obj_11)
    (pred_3 obj_13)
    (pred_5 obj_04 obj_03)
    (pred_3 obj_04)
    (pred_6 obj_05)
    (pred_5 obj_05 obj_08)
    (pred_6 obj_01)
    (pred_5 obj_01 obj_08)
    (pred_6 obj_06)
    (pred_5 obj_06 obj_08)
    (pred_4 obj_09 obj_03)
    (pred_4 obj_02 obj_08)
    (pred_4 obj_03 obj_12)
    (pred_4 obj_12 obj_11)
    (pred_4 obj_11 obj_02)
)
 (:goal
  (and
   (pred_2 obj_05)
   (pred_2 obj_01)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_01)) (not (pred_2 obj_06))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_09)))
  )
)
)
