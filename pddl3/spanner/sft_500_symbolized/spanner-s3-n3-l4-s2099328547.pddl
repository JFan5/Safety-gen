; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2099328547 --problem-name spanner-s3-n3-l4-s2099328547
(define (problem spanner-s3-n3-l4-s2099328547)
 (:domain spanner)
 (:objects 
     obj_13 - type_2
     obj_10 obj_12 obj_07 - type_5
     obj_02 obj_06 obj_11 - type_4
     obj_08 obj_04 obj_09 obj_03 - type_1
     obj_05 obj_01 - type_1
    )
 (:init 
    (pred_6 obj_13 obj_05)
    (pred_6 obj_10 obj_04)
    (pred_4 obj_10)
    (pred_6 obj_12 obj_03)
    (pred_4 obj_12)
    (pred_6 obj_07 obj_04)
    (pred_4 obj_07)
    (pred_3 obj_02)
    (pred_6 obj_02 obj_01)
    (pred_3 obj_06)
    (pred_6 obj_06 obj_01)
    (pred_3 obj_11)
    (pred_6 obj_11 obj_01)
    (pred_1 obj_05 obj_08)
    (pred_1 obj_03 obj_01)
    (pred_1 obj_08 obj_04)
    (pred_1 obj_04 obj_09)
    (pred_1 obj_09 obj_03)
)
 (:goal
  (and
   (pred_2 obj_02)
   (pred_2 obj_06)
   (pred_2 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_02)) (not (pred_2 obj_06))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_05)))
  )
)
)
