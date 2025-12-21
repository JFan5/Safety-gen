; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1929802938 --problem-name spanner-s3-n2-l4-s1929802938
(define (problem spanner-s3-n2-l4-s1929802938)
 (:domain spanner)
 (:objects 
     obj_10 - type_3
     obj_11 obj_04 obj_09 - type_5
     obj_01 obj_03 - type_4
     obj_06 obj_05 obj_12 obj_02 - type_2
     obj_07 obj_08 - type_2
    )
 (:init 
    (pred_2 obj_10 obj_07)
    (pred_2 obj_11 obj_06)
    (pred_1 obj_11)
    (pred_2 obj_04 obj_12)
    (pred_1 obj_04)
    (pred_2 obj_09 obj_06)
    (pred_1 obj_09)
    (pred_5 obj_01)
    (pred_2 obj_01 obj_08)
    (pred_5 obj_03)
    (pred_2 obj_03 obj_08)
    (pred_6 obj_07 obj_06)
    (pred_6 obj_02 obj_08)
    (pred_6 obj_06 obj_05)
    (pred_6 obj_05 obj_12)
    (pred_6 obj_12 obj_02)
)
 (:goal
  (and
   (pred_3 obj_01)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_01)) (not (pred_3 obj_03))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_07)))
  )
)
)
