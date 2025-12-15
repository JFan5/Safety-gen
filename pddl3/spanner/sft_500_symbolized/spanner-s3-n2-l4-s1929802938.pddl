; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1929802938 --problem-name spanner-s3-n2-l4-s1929802938
(define (problem spanner-s3-n2-l4-s1929802938)
 (:domain spanner)
 (:objects 
     obj_05 - type_4
     obj_11 obj_03 obj_12 - type_3
     obj_02 obj_04 - type_2
     obj_10 obj_08 obj_06 obj_01 - type_1
     obj_07 obj_09 - type_1
    )
 (:init 
    (pred_2 obj_05 obj_07)
    (pred_2 obj_11 obj_10)
    (pred_6 obj_11)
    (pred_2 obj_03 obj_06)
    (pred_6 obj_03)
    (pred_2 obj_12 obj_10)
    (pred_6 obj_12)
    (pred_4 obj_02)
    (pred_2 obj_02 obj_09)
    (pred_4 obj_04)
    (pred_2 obj_04 obj_09)
    (pred_3 obj_07 obj_10)
    (pred_3 obj_01 obj_09)
    (pred_3 obj_10 obj_08)
    (pred_3 obj_08 obj_06)
    (pred_3 obj_06 obj_01)
)
 (:goal
  (and
   (pred_1 obj_02)
   (pred_1 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_02)) (not (pred_1 obj_04))))
    (forall (?m - type_4) (at-most-once (pred_2 ?m obj_07)))
  )
)
)
