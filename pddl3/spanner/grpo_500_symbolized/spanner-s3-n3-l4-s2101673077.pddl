; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2101673077 --problem-name spanner-s3-n3-l4-s2101673077
(define (problem spanner-s3-n3-l4-s2101673077)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_01 obj_03 obj_11 - type_3
     obj_10 obj_13 obj_07 - type_1
     obj_12 obj_02 obj_08 obj_06 - type_2
     obj_05 obj_04 - type_2
    )
 (:init 
    (pred_6 obj_09 obj_05)
    (pred_6 obj_01 obj_08)
    (pred_5 obj_01)
    (pred_6 obj_03 obj_08)
    (pred_5 obj_03)
    (pred_6 obj_11 obj_12)
    (pred_5 obj_11)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_04)
    (pred_4 obj_13)
    (pred_6 obj_13 obj_04)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_04)
    (pred_3 obj_05 obj_12)
    (pred_3 obj_06 obj_04)
    (pred_3 obj_12 obj_02)
    (pred_3 obj_02 obj_08)
    (pred_3 obj_08 obj_06)
)
 (:goal
  (and
   (pred_1 obj_10)
   (pred_1 obj_13)
   (pred_1 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_13)) (not (pred_1 obj_07))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_05)))
  )
)
)
