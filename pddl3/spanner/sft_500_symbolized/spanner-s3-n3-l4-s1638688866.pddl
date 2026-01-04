; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1638688866 --problem-name spanner-s3-n3-l4-s1638688866
(define (problem spanner-s3-n3-l4-s1638688866)
 (:domain spanner)
 (:objects 
     obj_13 - type_3
     obj_04 obj_09 obj_03 - type_2
     obj_02 obj_10 obj_01 - type_1
     obj_06 obj_05 obj_12 obj_08 - type_4
     obj_11 obj_07 - type_4
    )
 (:init 
    (pred_5 obj_13 obj_11)
    (pred_5 obj_04 obj_12)
    (pred_1 obj_04)
    (pred_5 obj_09 obj_05)
    (pred_1 obj_09)
    (pred_5 obj_03 obj_12)
    (pred_1 obj_03)
    (pred_3 obj_02)
    (pred_5 obj_02 obj_07)
    (pred_3 obj_10)
    (pred_5 obj_10 obj_07)
    (pred_3 obj_01)
    (pred_5 obj_01 obj_07)
    (pred_6 obj_11 obj_06)
    (pred_6 obj_08 obj_07)
    (pred_6 obj_06 obj_05)
    (pred_6 obj_05 obj_12)
    (pred_6 obj_12 obj_08)
)
 (:goal
  (and
   (pred_4 obj_02)
   (pred_4 obj_10)
   (pred_4 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_10)) (not (pred_4 obj_01))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_11)))
  )
)
)
