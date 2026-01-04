; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1306228016 --problem-name spanner-s3-n3-l4-s1306228016
(define (problem spanner-s3-n3-l4-s1306228016)
 (:domain spanner)
 (:objects 
     obj_12 - type_3
     obj_13 obj_05 obj_06 - type_1
     obj_04 obj_08 obj_01 - type_4
     obj_07 obj_03 obj_11 obj_02 - type_2
     obj_10 obj_09 - type_2
    )
 (:init 
    (pred_2 obj_12 obj_10)
    (pred_2 obj_13 obj_03)
    (pred_1 obj_13)
    (pred_2 obj_05 obj_02)
    (pred_1 obj_05)
    (pred_2 obj_06 obj_03)
    (pred_1 obj_06)
    (pred_4 obj_04)
    (pred_2 obj_04 obj_09)
    (pred_4 obj_08)
    (pred_2 obj_08 obj_09)
    (pred_4 obj_01)
    (pred_2 obj_01 obj_09)
    (pred_3 obj_10 obj_07)
    (pred_3 obj_02 obj_09)
    (pred_3 obj_07 obj_03)
    (pred_3 obj_03 obj_11)
    (pred_3 obj_11 obj_02)
)
 (:goal
  (and
   (pred_6 obj_04)
   (pred_6 obj_08)
   (pred_6 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_04)) (not (pred_6 obj_08))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_10)))
  )
)
)
