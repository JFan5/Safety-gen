; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2034314819 --problem-name spanner-s3-n3-l4-s2034314819
(define (problem spanner-s3-n3-l4-s2034314819)
 (:domain spanner)
 (:objects 
     obj_06 - type_2
     obj_08 obj_12 obj_13 - type_5
     obj_11 obj_07 obj_01 - type_1
     obj_05 obj_10 obj_02 obj_09 - type_4
     obj_03 obj_04 - type_4
    )
 (:init 
    (pred_5 obj_06 obj_03)
    (pred_5 obj_08 obj_05)
    (pred_2 obj_08)
    (pred_5 obj_12 obj_09)
    (pred_2 obj_12)
    (pred_5 obj_13 obj_02)
    (pred_2 obj_13)
    (pred_1 obj_11)
    (pred_5 obj_11 obj_04)
    (pred_1 obj_07)
    (pred_5 obj_07 obj_04)
    (pred_1 obj_01)
    (pred_5 obj_01 obj_04)
    (pred_3 obj_03 obj_05)
    (pred_3 obj_09 obj_04)
    (pred_3 obj_05 obj_10)
    (pred_3 obj_10 obj_02)
    (pred_3 obj_02 obj_09)
)
 (:goal
  (and
   (pred_4 obj_11)
   (pred_4 obj_07)
   (pred_4 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_11)) (not (pred_4 obj_07))))
    (forall (?m - type_2) (at-most-once (pred_5 ?m obj_03)))
  )
)
)
