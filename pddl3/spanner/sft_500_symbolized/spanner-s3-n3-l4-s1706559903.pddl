; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1706559903 --problem-name spanner-s3-n3-l4-s1706559903
(define (problem spanner-s3-n3-l4-s1706559903)
 (:domain spanner)
 (:objects 
     obj_06 - type_1
     obj_07 obj_10 obj_11 - type_2
     obj_03 obj_13 obj_01 - type_4
     obj_05 obj_12 obj_08 obj_04 - type_3
     obj_09 obj_02 - type_3
    )
 (:init 
    (pred_1 obj_06 obj_09)
    (pred_1 obj_07 obj_08)
    (pred_2 obj_07)
    (pred_1 obj_10 obj_04)
    (pred_2 obj_10)
    (pred_1 obj_11 obj_12)
    (pred_2 obj_11)
    (pred_4 obj_03)
    (pred_1 obj_03 obj_02)
    (pred_4 obj_13)
    (pred_1 obj_13 obj_02)
    (pred_4 obj_01)
    (pred_1 obj_01 obj_02)
    (pred_5 obj_09 obj_05)
    (pred_5 obj_04 obj_02)
    (pred_5 obj_05 obj_12)
    (pred_5 obj_12 obj_08)
    (pred_5 obj_08 obj_04)
)
 (:goal
  (and
   (pred_3 obj_03)
   (pred_3 obj_13)
   (pred_3 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_13)) (not (pred_3 obj_01))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_09)))
  )
)
)
