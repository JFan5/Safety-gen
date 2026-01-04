; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1182727560 --problem-name spanner-s3-n2-l4-s1182727560
(define (problem spanner-s3-n2-l4-s1182727560)
 (:domain spanner)
 (:objects 
     obj_09 - type_2
     obj_10 obj_06 obj_08 - type_1
     obj_05 obj_01 - type_5
     obj_02 obj_12 obj_11 obj_07 - type_3
     obj_04 obj_03 - type_3
    )
 (:init 
    (pred_6 obj_09 obj_04)
    (pred_6 obj_10 obj_07)
    (pred_5 obj_10)
    (pred_6 obj_06 obj_07)
    (pred_5 obj_06)
    (pred_6 obj_08 obj_11)
    (pred_5 obj_08)
    (pred_2 obj_05)
    (pred_6 obj_05 obj_03)
    (pred_2 obj_01)
    (pred_6 obj_01 obj_03)
    (pred_4 obj_04 obj_02)
    (pred_4 obj_07 obj_03)
    (pred_4 obj_02 obj_12)
    (pred_4 obj_12 obj_11)
    (pred_4 obj_11 obj_07)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_05)) (not (pred_3 obj_01))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_04)))
  )
)
)
