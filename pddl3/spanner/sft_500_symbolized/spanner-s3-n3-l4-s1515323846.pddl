; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1515323846 --problem-name spanner-s3-n3-l4-s1515323846
(define (problem spanner-s3-n3-l4-s1515323846)
 (:domain spanner)
 (:objects 
     obj_03 - type_5
     obj_09 obj_11 obj_08 - type_1
     obj_02 obj_05 obj_06 - type_3
     obj_07 obj_04 obj_01 obj_13 - type_2
     obj_10 obj_12 - type_2
    )
 (:init 
    (pred_5 obj_03 obj_10)
    (pred_5 obj_09 obj_04)
    (pred_1 obj_09)
    (pred_5 obj_11 obj_04)
    (pred_1 obj_11)
    (pred_5 obj_08 obj_04)
    (pred_1 obj_08)
    (pred_6 obj_02)
    (pred_5 obj_02 obj_12)
    (pred_6 obj_05)
    (pred_5 obj_05 obj_12)
    (pred_6 obj_06)
    (pred_5 obj_06 obj_12)
    (pred_3 obj_10 obj_07)
    (pred_3 obj_13 obj_12)
    (pred_3 obj_07 obj_04)
    (pred_3 obj_04 obj_01)
    (pred_3 obj_01 obj_13)
)
 (:goal
  (and
   (pred_2 obj_02)
   (pred_2 obj_05)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_02)) (not (pred_2 obj_05))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_10)))
  )
)
)
