; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1402946226 --problem-name spanner-s3-n3-l4-s1402946226
(define (problem spanner-s3-n3-l4-s1402946226)
 (:domain spanner)
 (:objects 
     obj_01 - type_2
     obj_09 obj_13 obj_07 - type_5
     obj_11 obj_02 obj_08 - type_1
     obj_10 obj_03 obj_12 obj_05 - type_4
     obj_06 obj_04 - type_4
    )
 (:init 
    (pred_6 obj_01 obj_06)
    (pred_6 obj_09 obj_05)
    (pred_2 obj_09)
    (pred_6 obj_13 obj_05)
    (pred_2 obj_13)
    (pred_6 obj_07 obj_05)
    (pred_2 obj_07)
    (pred_5 obj_11)
    (pred_6 obj_11 obj_04)
    (pred_5 obj_02)
    (pred_6 obj_02 obj_04)
    (pred_5 obj_08)
    (pred_6 obj_08 obj_04)
    (pred_1 obj_06 obj_10)
    (pred_1 obj_05 obj_04)
    (pred_1 obj_10 obj_03)
    (pred_1 obj_03 obj_12)
    (pred_1 obj_12 obj_05)
)
 (:goal
  (and
   (pred_4 obj_11)
   (pred_4 obj_02)
   (pred_4 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_02)) (not (pred_4 obj_08))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_06)))
  )
)
)
