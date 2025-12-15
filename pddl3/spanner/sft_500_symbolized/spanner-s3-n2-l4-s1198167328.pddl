; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1198167328 --problem-name spanner-s3-n2-l4-s1198167328
(define (problem spanner-s3-n2-l4-s1198167328)
 (:domain spanner)
 (:objects 
     obj_12 - type_1
     obj_01 obj_10 obj_05 - type_3
     obj_02 obj_07 - type_4
     obj_03 obj_08 obj_11 obj_06 - type_2
     obj_09 obj_04 - type_2
    )
 (:init 
    (pred_3 obj_12 obj_09)
    (pred_3 obj_01 obj_11)
    (pred_6 obj_01)
    (pred_3 obj_10 obj_11)
    (pred_6 obj_10)
    (pred_3 obj_05 obj_11)
    (pred_6 obj_05)
    (pred_1 obj_02)
    (pred_3 obj_02 obj_04)
    (pred_1 obj_07)
    (pred_3 obj_07 obj_04)
    (pred_2 obj_09 obj_03)
    (pred_2 obj_06 obj_04)
    (pred_2 obj_03 obj_08)
    (pred_2 obj_08 obj_11)
    (pred_2 obj_11 obj_06)
)
 (:goal
  (and
   (pred_5 obj_02)
   (pred_5 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_02)) (not (pred_5 obj_07))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_09)))
  )
)
)
