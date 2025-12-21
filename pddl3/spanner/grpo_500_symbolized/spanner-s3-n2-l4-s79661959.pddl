; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 79661959 --problem-name spanner-s3-n2-l4-s79661959
(define (problem spanner-s3-n2-l4-s79661959)
 (:domain spanner)
 (:objects 
     obj_03 - type_5
     obj_09 obj_02 obj_06 - type_3
     obj_12 obj_11 - type_1
     obj_10 obj_07 obj_08 obj_04 - type_2
     obj_01 obj_05 - type_2
    )
 (:init 
    (pred_6 obj_03 obj_01)
    (pred_6 obj_09 obj_07)
    (pred_5 obj_09)
    (pred_6 obj_02 obj_08)
    (pred_5 obj_02)
    (pred_6 obj_06 obj_07)
    (pred_5 obj_06)
    (pred_4 obj_12)
    (pred_6 obj_12 obj_05)
    (pred_4 obj_11)
    (pred_6 obj_11 obj_05)
    (pred_3 obj_01 obj_10)
    (pred_3 obj_04 obj_05)
    (pred_3 obj_10 obj_07)
    (pred_3 obj_07 obj_08)
    (pred_3 obj_08 obj_04)
)
 (:goal
  (and
   (pred_1 obj_12)
   (pred_1 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_12)) (not (pred_1 obj_11))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_01)))
  )
)
)
