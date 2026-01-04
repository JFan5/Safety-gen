; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1515323846 --problem-name spanner-s3-n3-l4-s1515323846
(define (problem spanner-s3-n3-l4-s1515323846)
 (:domain spanner)
 (:objects 
     obj_08 - type_5
     obj_09 obj_12 obj_11 - type_2
     obj_02 obj_04 obj_06 - type_3
     obj_03 obj_13 obj_01 obj_10 - type_4
     obj_07 obj_05 - type_4
    )
 (:init 
    (pred_1 obj_08 obj_07)
    (pred_1 obj_09 obj_13)
    (pred_5 obj_09)
    (pred_1 obj_12 obj_13)
    (pred_5 obj_12)
    (pred_1 obj_11 obj_13)
    (pred_5 obj_11)
    (pred_4 obj_02)
    (pred_1 obj_02 obj_05)
    (pred_4 obj_04)
    (pred_1 obj_04 obj_05)
    (pred_4 obj_06)
    (pred_1 obj_06 obj_05)
    (pred_3 obj_07 obj_03)
    (pred_3 obj_10 obj_05)
    (pred_3 obj_03 obj_13)
    (pred_3 obj_13 obj_01)
    (pred_3 obj_01 obj_10)
)
 (:goal
  (and
   (pred_2 obj_02)
   (pred_2 obj_04)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_02)) (not (pred_2 obj_04))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_07)))
  )
)
)
