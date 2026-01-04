; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1225627808 --problem-name spanner-s3-n2-l4-s1225627808
(define (problem spanner-s3-n2-l4-s1225627808)
 (:domain spanner)
 (:objects 
     obj_09 - type_2
     obj_07 obj_01 obj_12 - type_3
     obj_05 obj_11 - type_5
     obj_03 obj_06 obj_04 obj_10 - type_4
     obj_08 obj_02 - type_4
    )
 (:init 
    (pred_2 obj_09 obj_08)
    (pred_2 obj_07 obj_10)
    (pred_3 obj_07)
    (pred_2 obj_01 obj_04)
    (pred_3 obj_01)
    (pred_2 obj_12 obj_06)
    (pred_3 obj_12)
    (pred_4 obj_05)
    (pred_2 obj_05 obj_02)
    (pred_4 obj_11)
    (pred_2 obj_11 obj_02)
    (pred_1 obj_08 obj_03)
    (pred_1 obj_10 obj_02)
    (pred_1 obj_03 obj_06)
    (pred_1 obj_06 obj_04)
    (pred_1 obj_04 obj_10)
)
 (:goal
  (and
   (pred_6 obj_05)
   (pred_6 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_05)) (not (pred_6 obj_11))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_08)))
  )
)
)
