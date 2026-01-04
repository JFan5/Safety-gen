; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1929802938 --problem-name spanner-s3-n2-l4-s1929802938
(define (problem spanner-s3-n2-l4-s1929802938)
 (:domain spanner)
 (:objects 
     obj_06 - type_2
     obj_01 obj_12 obj_08 - type_4
     obj_04 obj_03 - type_5
     obj_10 obj_07 obj_09 obj_02 - type_3
     obj_11 obj_05 - type_3
    )
 (:init 
    (pred_6 obj_06 obj_11)
    (pred_6 obj_01 obj_10)
    (pred_5 obj_01)
    (pred_6 obj_12 obj_09)
    (pred_5 obj_12)
    (pred_6 obj_08 obj_10)
    (pred_5 obj_08)
    (pred_3 obj_04)
    (pred_6 obj_04 obj_05)
    (pred_3 obj_03)
    (pred_6 obj_03 obj_05)
    (pred_1 obj_11 obj_10)
    (pred_1 obj_02 obj_05)
    (pred_1 obj_10 obj_07)
    (pred_1 obj_07 obj_09)
    (pred_1 obj_09 obj_02)
)
 (:goal
  (and
   (pred_2 obj_04)
   (pred_2 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_04)) (not (pred_2 obj_03))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_11)))
  )
)
)
