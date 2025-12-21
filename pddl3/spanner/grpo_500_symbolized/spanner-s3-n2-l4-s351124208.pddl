; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 351124208 --problem-name spanner-s3-n2-l4-s351124208
(define (problem spanner-s3-n2-l4-s351124208)
 (:domain spanner)
 (:objects 
     obj_02 - type_5
     obj_05 obj_11 obj_07 - type_3
     obj_03 obj_08 - type_1
     obj_01 obj_09 obj_10 obj_12 - type_2
     obj_06 obj_04 - type_2
    )
 (:init 
    (pred_6 obj_02 obj_06)
    (pred_6 obj_05 obj_09)
    (pred_5 obj_05)
    (pred_6 obj_11 obj_10)
    (pred_5 obj_11)
    (pred_6 obj_07 obj_09)
    (pred_5 obj_07)
    (pred_4 obj_03)
    (pred_6 obj_03 obj_04)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_04)
    (pred_3 obj_06 obj_01)
    (pred_3 obj_12 obj_04)
    (pred_3 obj_01 obj_09)
    (pred_3 obj_09 obj_10)
    (pred_3 obj_10 obj_12)
)
 (:goal
  (and
   (pred_1 obj_03)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_03)) (not (pred_1 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_06)))
  )
)
)
