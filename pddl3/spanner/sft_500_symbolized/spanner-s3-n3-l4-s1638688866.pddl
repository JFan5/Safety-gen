; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1638688866 --problem-name spanner-s3-n3-l4-s1638688866
(define (problem spanner-s3-n3-l4-s1638688866)
 (:domain spanner)
 (:objects 
     obj_05 - type_2
     obj_03 obj_01 obj_10 - type_5
     obj_06 obj_09 obj_11 - type_4
     obj_07 obj_08 obj_04 obj_13 - type_1
     obj_12 obj_02 - type_1
    )
 (:init 
    (pred_6 obj_05 obj_12)
    (pred_6 obj_03 obj_04)
    (pred_3 obj_03)
    (pred_6 obj_01 obj_08)
    (pred_3 obj_01)
    (pred_6 obj_10 obj_04)
    (pred_3 obj_10)
    (pred_1 obj_06)
    (pred_6 obj_06 obj_02)
    (pred_1 obj_09)
    (pred_6 obj_09 obj_02)
    (pred_1 obj_11)
    (pred_6 obj_11 obj_02)
    (pred_2 obj_12 obj_07)
    (pred_2 obj_13 obj_02)
    (pred_2 obj_07 obj_08)
    (pred_2 obj_08 obj_04)
    (pred_2 obj_04 obj_13)
)
 (:goal
  (and
   (pred_5 obj_06)
   (pred_5 obj_09)
   (pred_5 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_09)) (not (pred_5 obj_11))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_12)))
  )
)
)
