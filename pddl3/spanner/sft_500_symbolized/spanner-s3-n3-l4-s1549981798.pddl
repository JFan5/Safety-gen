; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1549981798 --problem-name spanner-s3-n3-l4-s1549981798
(define (problem spanner-s3-n3-l4-s1549981798)
 (:domain spanner)
 (:objects 
     obj_09 - type_2
     obj_08 obj_06 obj_05 - type_4
     obj_02 obj_11 obj_10 - type_3
     obj_13 obj_03 obj_07 obj_01 - type_5
     obj_12 obj_04 - type_5
    )
 (:init 
    (pred_6 obj_09 obj_12)
    (pred_6 obj_08 obj_03)
    (pred_1 obj_08)
    (pred_6 obj_06 obj_07)
    (pred_1 obj_06)
    (pred_6 obj_05 obj_07)
    (pred_1 obj_05)
    (pred_5 obj_02)
    (pred_6 obj_02 obj_04)
    (pred_5 obj_11)
    (pred_6 obj_11 obj_04)
    (pred_5 obj_10)
    (pred_6 obj_10 obj_04)
    (pred_4 obj_12 obj_13)
    (pred_4 obj_01 obj_04)
    (pred_4 obj_13 obj_03)
    (pred_4 obj_03 obj_07)
    (pred_4 obj_07 obj_01)
)
 (:goal
  (and
   (pred_3 obj_02)
   (pred_3 obj_11)
   (pred_3 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_02)) (not (pred_3 obj_11))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_12)))
  )
)
)
