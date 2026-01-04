; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1621139299 --problem-name spanner-s3-n3-l4-s1621139299
(define (problem spanner-s3-n3-l4-s1621139299)
 (:domain spanner)
 (:objects 
     obj_04 - type_1
     obj_07 obj_09 obj_05 - type_5
     obj_01 obj_02 obj_12 - type_4
     obj_08 obj_10 obj_03 obj_13 - type_3
     obj_11 obj_06 - type_3
    )
 (:init 
    (pred_2 obj_04 obj_11)
    (pred_2 obj_07 obj_13)
    (pred_4 obj_07)
    (pred_2 obj_09 obj_13)
    (pred_4 obj_09)
    (pred_2 obj_05 obj_13)
    (pred_4 obj_05)
    (pred_1 obj_01)
    (pred_2 obj_01 obj_06)
    (pred_1 obj_02)
    (pred_2 obj_02 obj_06)
    (pred_1 obj_12)
    (pred_2 obj_12 obj_06)
    (pred_3 obj_11 obj_08)
    (pred_3 obj_13 obj_06)
    (pred_3 obj_08 obj_10)
    (pred_3 obj_10 obj_03)
    (pred_3 obj_03 obj_13)
)
 (:goal
  (and
   (pred_6 obj_01)
   (pred_6 obj_02)
   (pred_6 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_02)) (not (pred_6 obj_12))))
    (forall (?m - type_1) (at-most-once (pred_2 ?m obj_11)))
  )
)
)
