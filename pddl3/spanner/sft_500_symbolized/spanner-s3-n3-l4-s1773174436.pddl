; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1773174436 --problem-name spanner-s3-n3-l4-s1773174436
(define (problem spanner-s3-n3-l4-s1773174436)
 (:domain spanner)
 (:objects 
     obj_11 - type_4
     obj_08 obj_02 obj_07 - type_2
     obj_13 obj_06 obj_10 - type_5
     obj_01 obj_09 obj_04 obj_05 - type_3
     obj_12 obj_03 - type_3
    )
 (:init 
    (pred_5 obj_11 obj_12)
    (pred_5 obj_08 obj_04)
    (pred_3 obj_08)
    (pred_5 obj_02 obj_04)
    (pred_3 obj_02)
    (pred_5 obj_07 obj_04)
    (pred_3 obj_07)
    (pred_6 obj_13)
    (pred_5 obj_13 obj_03)
    (pred_6 obj_06)
    (pred_5 obj_06 obj_03)
    (pred_6 obj_10)
    (pred_5 obj_10 obj_03)
    (pred_4 obj_12 obj_01)
    (pred_4 obj_05 obj_03)
    (pred_4 obj_01 obj_09)
    (pred_4 obj_09 obj_04)
    (pred_4 obj_04 obj_05)
)
 (:goal
  (and
   (pred_1 obj_13)
   (pred_1 obj_06)
   (pred_1 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_06)) (not (pred_1 obj_10))))
    (forall (?m - type_4) (at-most-once (pred_5 ?m obj_12)))
  )
)
)
