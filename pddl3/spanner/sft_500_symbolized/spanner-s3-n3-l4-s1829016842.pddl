; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1829016842 --problem-name spanner-s3-n3-l4-s1829016842
(define (problem spanner-s3-n3-l4-s1829016842)
 (:domain spanner)
 (:objects 
     obj_07 - type_1
     obj_09 obj_06 obj_13 - type_2
     obj_12 obj_01 obj_03 - type_3
     obj_02 obj_04 obj_11 obj_10 - type_5
     obj_05 obj_08 - type_5
    )
 (:init 
    (pred_1 obj_07 obj_05)
    (pred_1 obj_09 obj_10)
    (pred_2 obj_09)
    (pred_1 obj_06 obj_10)
    (pred_2 obj_06)
    (pred_1 obj_13 obj_10)
    (pred_2 obj_13)
    (pred_4 obj_12)
    (pred_1 obj_12 obj_08)
    (pred_4 obj_01)
    (pred_1 obj_01 obj_08)
    (pred_4 obj_03)
    (pred_1 obj_03 obj_08)
    (pred_3 obj_05 obj_02)
    (pred_3 obj_10 obj_08)
    (pred_3 obj_02 obj_04)
    (pred_3 obj_04 obj_11)
    (pred_3 obj_11 obj_10)
)
 (:goal
  (and
   (pred_6 obj_12)
   (pred_6 obj_01)
   (pred_6 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_01)) (not (pred_6 obj_03))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_05)))
  )
)
)
