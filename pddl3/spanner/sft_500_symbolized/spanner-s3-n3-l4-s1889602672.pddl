; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1889602672 --problem-name spanner-s3-n3-l4-s1889602672
(define (problem spanner-s3-n3-l4-s1889602672)
 (:domain spanner)
 (:objects 
     obj_04 - type_2
     obj_11 obj_12 obj_08 - type_5
     obj_07 obj_02 obj_01 - type_1
     obj_03 obj_10 obj_13 obj_05 - type_4
     obj_06 obj_09 - type_4
    )
 (:init 
    (pred_4 obj_04 obj_06)
    (pred_4 obj_11 obj_05)
    (pred_3 obj_11)
    (pred_4 obj_12 obj_05)
    (pred_3 obj_12)
    (pred_4 obj_08 obj_05)
    (pred_3 obj_08)
    (pred_6 obj_07)
    (pred_4 obj_07 obj_09)
    (pred_6 obj_02)
    (pred_4 obj_02 obj_09)
    (pred_6 obj_01)
    (pred_4 obj_01 obj_09)
    (pred_5 obj_06 obj_03)
    (pred_5 obj_05 obj_09)
    (pred_5 obj_03 obj_10)
    (pred_5 obj_10 obj_13)
    (pred_5 obj_13 obj_05)
)
 (:goal
  (and
   (pred_2 obj_07)
   (pred_2 obj_02)
   (pred_2 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_02)) (not (pred_2 obj_01))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_06)))
  )
)
)
