; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1097072706 --problem-name spanner-s3-n3-l4-s1097072706
(define (problem spanner-s3-n3-l4-s1097072706)
 (:domain spanner)
 (:objects 
     obj_13 - type_3
     obj_01 obj_06 obj_02 - type_1
     obj_04 obj_05 obj_10 - type_5
     obj_08 obj_07 obj_03 obj_11 - type_2
     obj_12 obj_09 - type_2
    )
 (:init 
    (pred_1 obj_13 obj_12)
    (pred_1 obj_01 obj_08)
    (pred_4 obj_01)
    (pred_1 obj_06 obj_11)
    (pred_4 obj_06)
    (pred_1 obj_02 obj_08)
    (pred_4 obj_02)
    (pred_6 obj_04)
    (pred_1 obj_04 obj_09)
    (pred_6 obj_05)
    (pred_1 obj_05 obj_09)
    (pred_6 obj_10)
    (pred_1 obj_10 obj_09)
    (pred_5 obj_12 obj_08)
    (pred_5 obj_11 obj_09)
    (pred_5 obj_08 obj_07)
    (pred_5 obj_07 obj_03)
    (pred_5 obj_03 obj_11)
)
 (:goal
  (and
   (pred_3 obj_04)
   (pred_3 obj_05)
   (pred_3 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_04)) (not (pred_3 obj_05))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_12)))
  )
)
)
