; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1985129430 --problem-name spanner-s3-n3-l4-s1985129430
(define (problem spanner-s3-n3-l4-s1985129430)
 (:domain spanner)
 (:objects 
     obj_12 - type_4
     obj_09 obj_05 obj_01 - type_1
     obj_11 obj_06 obj_07 - type_5
     obj_02 obj_08 obj_03 obj_13 - type_3
     obj_10 obj_04 - type_3
    )
 (:init 
    (pred_1 obj_12 obj_10)
    (pred_1 obj_09 obj_03)
    (pred_4 obj_09)
    (pred_1 obj_05 obj_13)
    (pred_4 obj_05)
    (pred_1 obj_01 obj_03)
    (pred_4 obj_01)
    (pred_3 obj_11)
    (pred_1 obj_11 obj_04)
    (pred_3 obj_06)
    (pred_1 obj_06 obj_04)
    (pred_3 obj_07)
    (pred_1 obj_07 obj_04)
    (pred_5 obj_10 obj_02)
    (pred_5 obj_13 obj_04)
    (pred_5 obj_02 obj_08)
    (pred_5 obj_08 obj_03)
    (pred_5 obj_03 obj_13)
)
 (:goal
  (and
   (pred_2 obj_11)
   (pred_2 obj_06)
   (pred_2 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_06)) (not (pred_2 obj_07))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_10)))
  )
)
)
