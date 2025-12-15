; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1549981798 --problem-name spanner-s3-n3-l4-s1549981798
(define (problem spanner-s3-n3-l4-s1549981798)
 (:domain spanner)
 (:objects 
     obj_06 - type_1
     obj_08 obj_09 obj_10 - type_5
     obj_01 obj_12 obj_07 - type_3
     obj_11 obj_04 obj_13 obj_02 - type_2
     obj_05 obj_03 - type_2
    )
 (:init 
    (pred_4 obj_06 obj_05)
    (pred_4 obj_08 obj_04)
    (pred_2 obj_08)
    (pred_4 obj_09 obj_13)
    (pred_2 obj_09)
    (pred_4 obj_10 obj_13)
    (pred_2 obj_10)
    (pred_1 obj_01)
    (pred_4 obj_01 obj_03)
    (pred_1 obj_12)
    (pred_4 obj_12 obj_03)
    (pred_1 obj_07)
    (pred_4 obj_07 obj_03)
    (pred_6 obj_05 obj_11)
    (pred_6 obj_02 obj_03)
    (pred_6 obj_11 obj_04)
    (pred_6 obj_04 obj_13)
    (pred_6 obj_13 obj_02)
)
 (:goal
  (and
   (pred_3 obj_01)
   (pred_3 obj_12)
   (pred_3 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_01)) (not (pred_3 obj_12))))
    (forall (?m - type_1) (at-most-once (pred_4 ?m obj_05)))
  )
)
)
