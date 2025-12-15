; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1407586939 --problem-name spanner-s3-n3-l4-s1407586939
(define (problem spanner-s3-n3-l4-s1407586939)
 (:domain spanner)
 (:objects 
     obj_08 - type_1
     obj_10 obj_06 obj_02 - type_2
     obj_13 obj_04 obj_01 - type_5
     obj_11 obj_03 obj_05 obj_07 - type_4
     obj_12 obj_09 - type_4
    )
 (:init 
    (pred_3 obj_08 obj_12)
    (pred_3 obj_10 obj_05)
    (pred_6 obj_10)
    (pred_3 obj_06 obj_05)
    (pred_6 obj_06)
    (pred_3 obj_02 obj_05)
    (pred_6 obj_02)
    (pred_5 obj_13)
    (pred_3 obj_13 obj_09)
    (pred_5 obj_04)
    (pred_3 obj_04 obj_09)
    (pred_5 obj_01)
    (pred_3 obj_01 obj_09)
    (pred_2 obj_12 obj_11)
    (pred_2 obj_07 obj_09)
    (pred_2 obj_11 obj_03)
    (pred_2 obj_03 obj_05)
    (pred_2 obj_05 obj_07)
)
 (:goal
  (and
   (pred_1 obj_13)
   (pred_1 obj_04)
   (pred_1 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_04)) (not (pred_1 obj_01))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_12)))
  )
)
)
