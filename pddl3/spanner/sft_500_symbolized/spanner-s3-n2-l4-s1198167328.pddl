; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1198167328 --problem-name spanner-s3-n2-l4-s1198167328
(define (problem spanner-s3-n2-l4-s1198167328)
 (:domain spanner)
 (:objects 
     obj_12 - type_4
     obj_03 obj_06 obj_10 - type_5
     obj_04 obj_09 - type_3
     obj_05 obj_01 obj_02 obj_08 - type_2
     obj_11 obj_07 - type_2
    )
 (:init 
    (pred_4 obj_12 obj_11)
    (pred_4 obj_03 obj_02)
    (pred_1 obj_03)
    (pred_4 obj_06 obj_02)
    (pred_1 obj_06)
    (pred_4 obj_10 obj_02)
    (pred_1 obj_10)
    (pred_2 obj_04)
    (pred_4 obj_04 obj_07)
    (pred_2 obj_09)
    (pred_4 obj_09 obj_07)
    (pred_3 obj_11 obj_05)
    (pred_3 obj_08 obj_07)
    (pred_3 obj_05 obj_01)
    (pred_3 obj_01 obj_02)
    (pred_3 obj_02 obj_08)
)
 (:goal
  (and
   (pred_5 obj_04)
   (pred_5 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_04)) (not (pred_5 obj_09))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_11)))
  )
)
)
