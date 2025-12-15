; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1058075248 --problem-name spanner-s3-n2-l4-s1058075248
(define (problem spanner-s3-n2-l4-s1058075248)
 (:domain spanner)
 (:objects 
     obj_08 - type_3
     obj_07 obj_10 obj_04 - type_5
     obj_05 obj_01 - type_4
     obj_03 obj_02 obj_12 obj_09 - type_2
     obj_11 obj_06 - type_2
    )
 (:init 
    (pred_1 obj_08 obj_11)
    (pred_1 obj_07 obj_02)
    (pred_6 obj_07)
    (pred_1 obj_10 obj_02)
    (pred_6 obj_10)
    (pred_1 obj_04 obj_02)
    (pred_6 obj_04)
    (pred_5 obj_05)
    (pred_1 obj_05 obj_06)
    (pred_5 obj_01)
    (pred_1 obj_01 obj_06)
    (pred_2 obj_11 obj_03)
    (pred_2 obj_09 obj_06)
    (pred_2 obj_03 obj_02)
    (pred_2 obj_02 obj_12)
    (pred_2 obj_12 obj_09)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_05)) (not (pred_3 obj_01))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_11)))
  )
)
)
