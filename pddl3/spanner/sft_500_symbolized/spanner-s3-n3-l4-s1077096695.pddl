; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1077096695 --problem-name spanner-s3-n3-l4-s1077096695
(define (problem spanner-s3-n3-l4-s1077096695)
 (:domain spanner)
 (:objects 
     obj_03 - type_2
     obj_02 obj_05 obj_12 - type_5
     obj_01 obj_07 obj_10 - type_4
     obj_09 obj_06 obj_08 obj_04 - type_3
     obj_13 obj_11 - type_3
    )
 (:init 
    (pred_4 obj_03 obj_13)
    (pred_4 obj_02 obj_06)
    (pred_5 obj_02)
    (pred_4 obj_05 obj_09)
    (pred_5 obj_05)
    (pred_4 obj_12 obj_08)
    (pred_5 obj_12)
    (pred_6 obj_01)
    (pred_4 obj_01 obj_11)
    (pred_6 obj_07)
    (pred_4 obj_07 obj_11)
    (pred_6 obj_10)
    (pred_4 obj_10 obj_11)
    (pred_3 obj_13 obj_09)
    (pred_3 obj_04 obj_11)
    (pred_3 obj_09 obj_06)
    (pred_3 obj_06 obj_08)
    (pred_3 obj_08 obj_04)
)
 (:goal
  (and
   (pred_2 obj_01)
   (pred_2 obj_07)
   (pred_2 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_01)) (not (pred_2 obj_07))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_13)))
  )
)
)
