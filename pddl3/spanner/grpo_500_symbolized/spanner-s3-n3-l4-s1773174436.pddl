; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1773174436 --problem-name spanner-s3-n3-l4-s1773174436
(define (problem spanner-s3-n3-l4-s1773174436)
 (:domain spanner)
 (:objects 
     obj_08 - type_5
     obj_09 obj_06 obj_10 - type_3
     obj_13 obj_11 obj_03 - type_1
     obj_01 obj_05 obj_07 obj_02 - type_2
     obj_12 obj_04 - type_2
    )
 (:init 
    (pred_6 obj_08 obj_12)
    (pred_6 obj_09 obj_07)
    (pred_5 obj_09)
    (pred_6 obj_06 obj_07)
    (pred_5 obj_06)
    (pred_6 obj_10 obj_07)
    (pred_5 obj_10)
    (pred_4 obj_13)
    (pred_6 obj_13 obj_04)
    (pred_4 obj_11)
    (pred_6 obj_11 obj_04)
    (pred_4 obj_03)
    (pred_6 obj_03 obj_04)
    (pred_3 obj_12 obj_01)
    (pred_3 obj_02 obj_04)
    (pred_3 obj_01 obj_05)
    (pred_3 obj_05 obj_07)
    (pred_3 obj_07 obj_02)
)
 (:goal
  (and
   (pred_1 obj_13)
   (pred_1 obj_11)
   (pred_1 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_11)) (not (pred_1 obj_03))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_12)))
  )
)
)
