; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1924477295 --problem-name spanner-s3-n3-l4-s1924477295
(define (problem spanner-s3-n3-l4-s1924477295)
 (:domain spanner)
 (:objects 
     obj_05 - type_3
     obj_06 obj_04 obj_09 - type_1
     obj_10 obj_11 obj_03 - type_5
     obj_13 obj_07 obj_12 obj_01 - type_4
     obj_02 obj_08 - type_4
    )
 (:init 
    (pred_1 obj_05 obj_02)
    (pred_1 obj_06 obj_12)
    (pred_3 obj_06)
    (pred_1 obj_04 obj_01)
    (pred_3 obj_04)
    (pred_1 obj_09 obj_13)
    (pred_3 obj_09)
    (pred_4 obj_10)
    (pred_1 obj_10 obj_08)
    (pred_4 obj_11)
    (pred_1 obj_11 obj_08)
    (pred_4 obj_03)
    (pred_1 obj_03 obj_08)
    (pred_2 obj_02 obj_13)
    (pred_2 obj_01 obj_08)
    (pred_2 obj_13 obj_07)
    (pred_2 obj_07 obj_12)
    (pred_2 obj_12 obj_01)
)
 (:goal
  (and
   (pred_6 obj_10)
   (pred_6 obj_11)
   (pred_6 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_11)) (not (pred_6 obj_03))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_02)))
  )
)
)
