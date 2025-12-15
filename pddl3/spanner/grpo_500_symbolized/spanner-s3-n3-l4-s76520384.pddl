; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 76520384 --problem-name spanner-s3-n3-l4-s76520384
(define (problem spanner-s3-n3-l4-s76520384)
 (:domain spanner)
 (:objects 
     obj_07 - type_4
     obj_05 obj_12 obj_11 - type_5
     obj_13 obj_06 obj_04 - type_1
     obj_02 obj_09 obj_01 obj_10 - type_3
     obj_03 obj_08 - type_3
    )
 (:init 
    (pred_3 obj_07 obj_03)
    (pred_3 obj_05 obj_02)
    (pred_1 obj_05)
    (pred_3 obj_12 obj_02)
    (pred_1 obj_12)
    (pred_3 obj_11 obj_01)
    (pred_1 obj_11)
    (pred_5 obj_13)
    (pred_3 obj_13 obj_08)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_08)
    (pred_5 obj_04)
    (pred_3 obj_04 obj_08)
    (pred_4 obj_03 obj_02)
    (pred_4 obj_10 obj_08)
    (pred_4 obj_02 obj_09)
    (pred_4 obj_09 obj_01)
    (pred_4 obj_01 obj_10)
)
 (:goal
  (and
   (pred_2 obj_13)
   (pred_2 obj_06)
   (pred_2 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_13)) (not (pred_2 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_03)))
  )
)
)
