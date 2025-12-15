; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1621139299 --problem-name spanner-s3-n3-l4-s1621139299
(define (problem spanner-s3-n3-l4-s1621139299)
 (:domain spanner)
 (:objects 
     obj_06 - type_4
     obj_02 obj_11 obj_10 - type_2
     obj_04 obj_13 obj_05 - type_3
     obj_07 obj_03 obj_12 obj_01 - type_5
     obj_09 obj_08 - type_5
    )
 (:init 
    (pred_2 obj_06 obj_09)
    (pred_2 obj_02 obj_01)
    (pred_6 obj_02)
    (pred_2 obj_11 obj_01)
    (pred_6 obj_11)
    (pred_2 obj_10 obj_01)
    (pred_6 obj_10)
    (pred_3 obj_04)
    (pred_2 obj_04 obj_08)
    (pred_3 obj_13)
    (pred_2 obj_13 obj_08)
    (pred_3 obj_05)
    (pred_2 obj_05 obj_08)
    (pred_5 obj_09 obj_07)
    (pred_5 obj_01 obj_08)
    (pred_5 obj_07 obj_03)
    (pred_5 obj_03 obj_12)
    (pred_5 obj_12 obj_01)
)
 (:goal
  (and
   (pred_4 obj_04)
   (pred_4 obj_13)
   (pred_4 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_13)) (not (pred_4 obj_05))))
    (forall (?m - type_4) (at-most-once (pred_2 ?m obj_09)))
  )
)
)
